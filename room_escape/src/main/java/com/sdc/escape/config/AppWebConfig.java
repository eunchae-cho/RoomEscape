package com.sdc.escape.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.util.UrlPathHelper;

@ComponentScan("com.sdc.escape.web")
@EnableWebMvc
public class AppWebConfig implements WebMvcConfigurer {
    
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver view = new InternalResourceViewResolver();
        view.setPrefix("/WEB-INF/jsp/");
        view.setSuffix(".jsp");
        return view;
    }

    @Bean
    public MultipartResolver multipartResolver() {
      CommonsMultipartResolver mr = new CommonsMultipartResolver();
      mr.setMaxUploadSize(1000000000);
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
}
