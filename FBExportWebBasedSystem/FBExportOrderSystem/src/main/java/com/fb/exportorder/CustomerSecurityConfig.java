//package com.fb.exportorder;
//
//import java.io.IOException;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import com.fb.exportorder.module.customer.handlers.LoginFailureHandler;
//import com.fb.exportorder.module.customer.handlers.LoginSuccessHandler;
//
//@Configuration
//@EnableWebSecurity
//@Order(2)
//public class CustomerSecurityConfig extends WebSecurityConfigurerAdapter {
//	
//	  private static String[] CSRF_IGNORED_URLS = {
//			  "/register",
//			  "/admin/add-new-employee"
//	  };
//	  
//	  @Autowired
//	  private UserDetailsService userDetailsService;
//	  
//	  @Bean
//	  public BCryptPasswordEncoder passwordEncoder() {
//	    return new BCryptPasswordEncoder();
//	  };
//	  
//	  @Autowired
//	  private LoginFailureHandler loginFailureHandler;
//	  
//	  @Autowired
//	  private LoginSuccessHandler loginSuccessHandler;
//	  
//	  @Override
//	  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//	    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
//	  }
//
//	  @Override
//	  protected void configure(HttpSecurity http) throws Exception {
//
//		  http.authorizeRequests()
//	    	.antMatchers("/view-profile/**",
//	    			 	 "/notifications/**",
//	    				 "/order-list/**",
//	    				 "/shipping/**",
//	    				 "/your-address/**",
//	    				 "/account-settings/**",
//	    				 "/place-order").hasAuthority("CUSTOMER")
//	    	.and()
//	    	.formLogin()
//	    	.loginPage("/customer/login")
//	    	.successHandler(loginSuccessHandler)
//	    	.failureHandler(loginFailureHandler)
//	    	.and()
//	    	.logout()
//	    	.logoutUrl("/customer")
//	    	.logoutSuccessUrl("/customer")
//	    	.and()
//	    	.csrf()
//	    	.ignoringAntMatchers(CSRF_IGNORED_URLS);
//	    
//	  }
//	
//
//	
//}
