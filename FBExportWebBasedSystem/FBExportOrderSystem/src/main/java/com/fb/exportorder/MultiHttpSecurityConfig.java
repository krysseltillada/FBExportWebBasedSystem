package com.fb.exportorder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
public class MultiHttpSecurityConfig {

    @Configuration
    @Order(2)
    public static class CustomerSecurityConfiguration extends WebSecurityConfigurerAdapter {
    	
    	private static final String[] CSRF_IGNORE_URLS = {"/register", "/sign-up", "/edit-account"};
    	
    	@Autowired
    	@Qualifier("customerUserDetailsService")
    	UserDetailsService userDetailService;
    	
    	@Autowired
    	LoginSuccessHandler loginSuccessHandler;
    	
    	@Autowired
    	LoginFailureHandler loginFailureHandler;
    	
    	@Autowired
    	BCryptPasswordEncoder passwordEncoder;
    	
    	@Override
	   	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	   	   auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder);
	   	}


        protected void configure(HttpSecurity http) throws Exception {
        	http.antMatcher("/**")
        		.authorizeRequests()
        		.antMatchers("/view-profile",
        					 "/notifications",
        					 "/your-address",
        					 "/account-settings",
        					 "/edit-account")
        		.hasAuthority("CUSTOMER")
        		.and()
        		.authorizeRequests()
        		.antMatchers("/sign-up")
        		.anonymous()
        		.and()
        		.formLogin()
        		.loginPage("/login")
        		.defaultSuccessUrl("/")
        		.successHandler(loginSuccessHandler)
        		.failureHandler(loginFailureHandler)
        		.and()
        		.logout()
        		.logoutUrl("/sign-out")
        		.logoutSuccessUrl("/")
        		.and()
        		.csrf().ignoringAntMatchers(CSRF_IGNORE_URLS);
        	
        }
    }

    @Configuration
    @Order(1)
    public static class AdminSecurityConfiguration extends WebSecurityConfigurerAdapter {
    	
    	@Autowired
    	@Qualifier("adminEmployeeUserDetailsService")
    	UserDetailsService userDetailService;
    	
    	@Autowired
    	BCryptPasswordEncoder passwordEncoder;

    	@Override
	   	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    		
	   	   auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder);
	   	}

        protected void configure(HttpSecurity http) throws Exception {
        	
        	http.antMatcher("/admin/**")
        		.authorizeRequests()
        		.antMatchers("/admin/dashboard").hasAnyAuthority("ADMIN", "EMPLOYEE")
        		.and()
	    		.formLogin()
	    		.loginPage("/admin/login")
	    		.defaultSuccessUrl("/admin/dashboard")
	    		.and()
	    		.exceptionHandling().accessDeniedPage("/error");
        }
    }
}