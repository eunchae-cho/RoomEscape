package com.sdc.escape.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[] {RootConfig.class, DatabaseConfig.class, MybatisConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return  new Class<?>[] {AppWebConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

//   @Override
//     protected String getServletName() {
//         return "app";
//     }
}
