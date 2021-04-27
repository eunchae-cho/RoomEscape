package com.sdc.escape.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

@MapperScan("com.sdc.escape.dao")
public class MybatisConfig {
    
    @Bean
    public SqlSessionFactory sqlSessionFactory(
        DataSource dataSource,
        ApplicationContext appCtx) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setTypeAliasesPackage("com.sdc.escape.domain");
        sqlSessionFactoryBean.setMapperLocations(appCtx.getResources("classpath:com/sdc/escape/mapper/*Mapper.xml"));
        return sqlSessionFactoryBean.getObject();
    }
}
