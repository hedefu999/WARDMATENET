package com.wardmate.websocket;

import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class ModifiedServerEndpointConfigurator extends SpringConfigurator{
    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        HttpSession httpSession = (HttpSession) request.getHttpSession();
        sec.getUserProperties().put(HttpSession.class.getName(),httpSession);
        super.modifyHandshake(sec, request, response);
    }
}