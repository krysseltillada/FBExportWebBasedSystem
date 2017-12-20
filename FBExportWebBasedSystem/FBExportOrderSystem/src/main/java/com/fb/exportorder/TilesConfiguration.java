package com.fb.exportorder;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;


@Configuration
public class TilesConfiguration {
	
	 @Bean
	    public TilesConfigurer tilesConfigurer(){
	        TilesConfigurer tilesConfigurer = new TilesConfigurer();
	        tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/templates/tiles.xml"});
	        tilesConfigurer.setCheckRefresh(true);
	        return tilesConfigurer;
	    }
	 
	   
	 @Bean
	 public TilesViewResolver tilesViewResolver() {
		 	TilesViewResolver viewResolver = new TilesViewResolver();
		 	viewResolver.setOrder(Ordered.LOWEST_PRECEDENCE - 1);
		 	return viewResolver;
	 }


}
	