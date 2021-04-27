package com.sdc.escape.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

@ComponentScan(value = "com.sdc.escape",
   excludeFilters = {@Filter(type = FilterType.REGEX, pattern = "com.sdc.escape.web.*")})
public class RootConfig {
}
