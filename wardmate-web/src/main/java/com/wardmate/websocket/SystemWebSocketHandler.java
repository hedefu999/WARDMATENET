package com.wardmate.websocket;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

@Component
public class SystemWebSocketHandler implements WebSocketHandler {
    Logger logger = LogManager.getLogger();
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        logger.info("afterConnectionEstablished");
        webSocketSession.sendMessage(new TextMessage("Server is ok!"));
    }

    @Override
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
        TextMessage returnMessage = new TextMessage(webSocketMessage.getPayload()+"was received by Server");
        logger.info(webSocketSession.getHandshakeHeaders().getFirst("Cookie"));
        webSocketSession.sendMessage(returnMessage);
    }

    @Override
    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
        if(webSocketSession.isOpen()) webSocketSession.close();
    }

    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
        logger.info("afterConnectionClosed");
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }
}
