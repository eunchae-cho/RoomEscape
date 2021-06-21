package com.sdc.escape.config;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.util.UrlPathHelper;

import com.sdc.escape.web.interceptor.AuthAdminInterceptor;
import com.sdc.escape.web.interceptor.AuthInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan("com.sdc.escape.web")
public class AppWebConfig implements WebMvcConfigurer {
    
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver view = new InternalResourceViewResolver();
        view.setPrefix("/WEB-INF/jsp/");
        view.setSuffix(".jsp");
        return view;
    }
    
    @Bean
    public HttpMessageConverter<String> responseBodyConverter() {
        return new StringHttpMessageConverter(Charset.forName("UTF-8"));
    }
    
//    @Bean
//    public CharacterEncodingFilter characterEncodingFilter() {
//    	CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
//        characterEncodingFilter.setEncoding("UTF-8");
//        characterEncodingFilter.setForceEncoding(true);
//        return characterEncodingFilter;
//    }
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry.addResourceHandler("/bootstrap/**")
    	.addResourceLocations("/bootstrap/");
    	registry.addResourceHandler("/upload/**")
    	.addResourceLocations("/upload/");
    	registry.addResourceHandler("/img/**")
    	.addResourceLocations("/img/");
    	registry.addResourceHandler("/fullcalendar/**")
    	.addResourceLocations("/fullcalendar/");
    }
    
    

    @Bean
    public MultipartResolver multipartResolver() {
      CommonsMultipartResolver mr = new CommonsMultipartResolver();
      mr.setMaxUploadSize(100000000);
      mr.setMaxInMemorySize(2000000000);
      mr.setMaxUploadSizePerFile(50000000);
      return mr;
    }

    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        UrlPathHelper urlPathHelper = new UrlPathHelper();
        urlPathHelper.setRemoveSemicolonContent(false);
        configurer.setUrlPathHelper(urlPathHelper);
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	
    	List<String> urlPatterns
    		=  Arrays.asList("/mypage/**", "/reservation/**");
    	registry.addInterceptor(new AuthInterceptor())
    				.addPathPatterns(urlPatterns)
    				.excludePathPatterns("/login")
    				.excludePathPatterns("/admin/**");
    	
    	List<String> urlPatternsNormal
		=  Arrays.asList("/auth/**", "/mypage/**", "/reservation/**", "/room/**");
    	registry.addInterceptor(new AuthAdminInterceptor())
    					.addPathPatterns("/admin/**")
    					.excludePathPatterns("/login")
    					.excludePathPatterns("/admin/login")
    					.excludePathPatterns(urlPatternsNormal);
  
    	
    }
}
