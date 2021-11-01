package com.devpro.shop14.conf;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration // -> bao spring biet day la file cau hinh cho MVC
public class MVCConf implements WebMvcConfigurer {
	
	public final static String PATH_UPLOAD_FILE = "D:\\J52_dev_pro\\com.devpro.shop14\\upload\\";

	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry rigistry ) {
		rigistry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		rigistry.addResourceHandler("/manager/**").addResourceLocations("classpath:/manager/");
		
		rigistry.addResourceHandler("/upload/**").addResourceLocations("file:" + PATH_UPLOAD_FILE);
	}
	
	
	@Bean // -> bao spring biet folder chua view
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class); //view engine dung de doc data tu controller tra ve va tron voi html code.
		bean.setPrefix("/WEB-INF/views/"); //duong da toi folder chua views(user + manager)
		bean.setSuffix(".jsp"); //duoi file cua view
		return bean;
	}
	@Bean
	public FilterRegistrationBean filterRegistrationBean() {
	    CharacterEncodingFilter filter = new CharacterEncodingFilter();
	    filter.setEncoding("UTF-8");

	    FilterRegistrationBean registrationBean = new FilterRegistrationBean();
	    registrationBean.setFilter(filter);
	    registrationBean.addUrlPatterns("/*");
	    return registrationBean;
	}
}
