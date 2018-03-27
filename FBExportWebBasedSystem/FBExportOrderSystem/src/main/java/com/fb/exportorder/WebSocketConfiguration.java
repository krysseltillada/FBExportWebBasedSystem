package com.fb.exportorder;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfiguration extends AbstractWebSocketMessageBrokerConfigurer {
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
	    config.enableSimpleBroker("/queue", "/topic");
	    config.setApplicationDestinationPrefixes("/app", "/app/admin");
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/customer/notification").setAllowedOrigins("*").withSockJS();
		registry.addEndpoint("/admin/notification").setAllowedOrigins("*").withSockJS();
	}

}
