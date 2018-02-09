package com.wardmate.websocket;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import java.util.Map;

@Component
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
                                   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        //强行修改请求头，解决老浏览器的The extension [x-webkit-deflate-frame] is not supported问题
        if(request.getHeaders().containsKey("Sec-WebSocket-Extensions")){
            request.getHeaders().set("Sec-WebSocket-Extensions","permessage-deflate");
        }
        System.out.println("com.wardmate.websocket.HandshakeInterceptor beforeHandShake");
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
        System.out.println("com.wardmate.websocket.HandshakeInterceptor afterHandShake");
        super.afterHandshake(request, response, wsHandler, ex);
    }
}
