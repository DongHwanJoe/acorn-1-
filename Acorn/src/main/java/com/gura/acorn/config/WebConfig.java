package com.gura.acorn.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gura.acorn.Interceptor.LoggingInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Autowired
    LoggingInterceptor loggingInterceptor;
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loggingInterceptor)
        .addPathPatterns("/users/*", "/shop/list", "/shop/detail", "/error/*", "/statistics/*","/search/*" , "/")
        .excludePathPatterns("/users/signup_form", "/users/loginform", "/users/pwd_updateform",
        		"/es/test");
    }
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

}