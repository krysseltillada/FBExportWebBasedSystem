package com.fb.exportorder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.fb.exportorder.module.customer.handlers.LoginFailureHandler;
import com.fb.exportorder.module.customer.handlers.LoginSuccessHandler;

@Configuration
@EnableWebSecurity
@Order(2)
public class AdminSecurityConfig extends WebSecurityConfigurerAdapter { 
	  
	  private static String[] CSRF_IGNORED_URLS = {
			  "/admin/add-new-employee"
	  };
	  @Autowired
	  private UserDetailsService userDetailsService;
	  
	  @Autowired
	  BCryptPasswordEncoder passwordEncoder;
	  
	  @Override
	  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
	  }

	  @Override
	  protected void configure(HttpSecurity http) throws Exception {

		  http.authorizeRequests()
		  	.antMatchers("/admin/dashboard")
		  	.hasAnyAuthority("ADMIN", "EMPLOYEE")
		  	.and()
		  	.formLogin()
		  	.loginPage("/admin/login")
		  	.and()
		  	.csrf()
		  	.ignoringAntMatchers(CSRF_IGNORED_URLS);
		  
	  }

}
