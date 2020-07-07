package com.spring.config.javaConfig;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
	ContextDataSource.class
	,ContextSqlMapper.class
})
@ComponentScan(basePackages = {"com.spring"})
public class RootConfig {

	
	
}
