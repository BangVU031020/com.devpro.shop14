package com.devpro.shop14.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
		
		// permit static files can access
		.antMatchers("/user/**", "/admin/**", "/common/**", "/oauth2/**")
		.permitAll()
		
		// all request "/admin/**" must to login
		.antMatchers("/admin/**").hasAuthority("ADMIN")
		
		.and()
		
		// config for login
		.formLogin().loginPage("/login").loginProcessingUrl("/perform_login").defaultSuccessUrl("/index", true)
		.failureUrl("/login?login_error=true")
		.permitAll()
		.and()
		

		//cấu hình cho phần logout
		.logout().logoutUrl("/logout").logoutSuccessUrl("/index").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		.permitAll();
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder(4).encode("guest"));
	}
}
