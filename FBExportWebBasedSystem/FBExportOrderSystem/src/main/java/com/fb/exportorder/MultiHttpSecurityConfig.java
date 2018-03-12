package com.fb.exportorder;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.fb.exportorder.module.customer.handlers.LoginFailureHandler;
import com.fb.exportorder.module.customer.handlers.LoginSuccessHandler;

@Configuration
@EnableWebSecurity
public class MultiHttpSecurityConfig {

    @Configuration
    @Order(2)
    public static class CustomerSecurityConfiguration extends WebSecurityConfigurerAdapter {
    	
//    	private static final String[] CSRF_IGNORE_URLS = {"/register", 
//    													  "/sign-up", 
//    													  "/edit-account", 
//    													  "/add-address",
//    													  "/edit-address",
//    													  "/delete-address",
//    													  "/set-default-shipping-address",
//    													  "/see-more-activities",
//    													  "/delete-all-activity"};
    	
    	@Autowired
    	@Qualifier("customerUserDetailsService")
    	UserDetailsService userDetailService;
    	
    	@Autowired
    	@Qualifier("customerLoginSuccessHandler")
    	com.fb.exportorder.module.customer.handlers.LoginSuccessHandler loginSuccessHandler;
    	
    	@Autowired
    	@Qualifier("customerLoginFailureHandler")
    	com.fb.exportorder.module.customer.handlers.LoginFailureHandler loginFailureHandler;
    	
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
        					 "/edit-account",
        					 "/place-order",
        					 "/place-order/order",
        					 "/order-success",
        					 "/order-list",
        					 "/payment-receipt")
        		.hasAuthority("CUSTOMER")
        		.and()
        		.authorizeRequests()
        		.antMatchers("/sign-up")
        		.anonymous()
        		.and()
        		.formLogin()
        		.loginPage("/login")
        		.successHandler(loginSuccessHandler)
        		.failureHandler(loginFailureHandler)
        		.and()
        		.logout()
        		.logoutUrl("/sign-out")
        		.logoutSuccessUrl("/")
        		.and()
        		.exceptionHandling()
        		.accessDeniedPage("/error");
//        		.and()
//        		.csrf().ignoringAntMatchers(CSRF_IGNORE_URLS);
//        	
        	
        }
    }

    @Configuration
    @Order(1)
    public static class AdminSecurityConfiguration extends WebSecurityConfigurerAdapter {
    	
    	//AJAX needs to ignore
    	private static final String[] CSRF_IGNORE_URLS = {
    			  "/admin/show-customer-activity", 
				  "/admin/enabled-customer",
				  "/admin/enabled-employee",
				  "/admin/enabled-admin",
				  "/admin/add-product/add-preview-images",
				  "/admin/add-product/delete-preview-images/**"};
    	
    	@Autowired
    	@Qualifier("adminEmployeeUserDetailsService")
    	UserDetailsService userDetailService;
    	
    	@Autowired
    	BCryptPasswordEncoder passwordEncoder;
    	
    	@Autowired
    	@Qualifier("adminLoginSuccessHandler")
    	com.fb.exportorder.module.admin.handlers.LoginSuccessHandler loginSuccessHandler;
    	
    	@Autowired
    	@Qualifier("adminLoginFailureHandler")
    	com.fb.exportorder.module.admin.handlers.LoginFailureHandler loginFailureHandler;

    	@Override
	   	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    		
	   	   auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder);
	   	}

        protected void configure(HttpSecurity http) throws Exception {
        	
        	http.antMatcher("/admin/**")
        		.authorizeRequests()
        		.antMatchers("/admin/dashboard",
        					 "/admin/inventory",
        					 "/admin/add-product",
        					 "/admin/add-product/add",
        					 "/admin/add-product/add-preview-images",
        					 "/admin/inventory/edit-product/*",
        					 "/admin/manage-accounts",
        					 "/admin/orders",
        					 "/admin/system-settings",
        					 "/admin/report-logs").hasAnyAuthority("ADMIN", "EMPLOYEE")
        		.and()
	    		.formLogin()
	    		.loginPage("/admin/login")
	    		.successHandler(loginSuccessHandler)
	    		.failureHandler(loginFailureHandler)
	    		.and()
	    		.logout()
	    		.logoutUrl("/admin/sign-out")
	    		.logoutSuccessUrl("/admin/login")
	    		.and()
	    		.exceptionHandling().accessDeniedPage("/error")
	    		.and()
	    		.csrf().ignoringAntMatchers(CSRF_IGNORE_URLS);

        }
    }
}