package com.wardmate.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer{
    @Autowired
    private SystemWebSocketHandler systemWebSocketHandler;
    private HandshakeInterceptor interceptor = new HandshakeInterceptor();
    public WebSocketConfig() {
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(systemWebSocketHandler,"/websocket").addInterceptors(new HandshakeInterceptor());
        System.out.println("WebSocketHandler was registered");
        registry.addHandler(systemWebSocketHandler,"/sockjs/websocket")
                .addInterceptors(new HandshakeInterceptor()).withSockJS();
    }
}
