package com.green.light.comm;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.BeanNameViewResolver;


@Configuration
@EnableWebMvc
public class ApatchPOIWebConfig {

	
	// view 이름을 가지고 출력할 view를 선택할 수 있는 view resolver 
    @Bean
    public ViewResolver beanNameViewResolver() {
        BeanNameViewResolver resolver = new BeanNameViewResolver();
        //Controller에 의해서 반환되는 view명이 만약 Bean의 이름이 있다면 0순위를 갖도록 한다
        resolver.setOrder(0);
        return resolver;
    }
    
    //@Controller의 return의 viewname이 처리 되는 메소드
    @Bean
    public ExcelView excelView() {
        return new ExcelView();
    }
//    @Bean
//    public ExcelStyleView ExcelStyleView() {
//    	return new ExcelStyleView();
//    }
	
}
