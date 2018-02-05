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

@Configuration
@EnableWebSecurity
@Order(1)
public class CustomerSecurityConfig extends WebSecurityConfigurerAdapter {
	
	  private static String[] CSRF_IGNORED_URLS = {
			  "/register"
	  };

	  @Autowired
	  private UserDetailsService userDetailsService;
	  
	  @Bean
	  public BCryptPasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	  };
	  
	  @Override
	  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	  }

	  @Override
	  protected void configure(HttpSecurity http) throws Exception {
	    http.authorizeRequests()
	    	.antMatchers("/view-profile",
	    			 	 "/notifications",
	    				 "/order-list",
	    				 "/shipping",
	    				 "/your-address",
	    				 "/account-settings",
	    				 "/place-order").hasAuthority("CUSTOMER")
	    	.and()
	    	.formLogin()
	    	.loginPage("/login")
	    	.failureUrl("/login")
	    	.and()
	    	.logout()
	    	.logoutUrl("/home")
	    	.and()
	    	.csrf()
	    	.ignoringAntMatchers(CSRF_IGNORED_URLS);
	    
	  }
	

	
}
