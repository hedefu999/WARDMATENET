package com.wardmate.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {
    //The method annotated with @MessageMapping works for WebSocket protocol communication. This defines the URL mapping.
    @MessageMapping("/hello")
    //@SendTo defines a URL pattern to send result.
    @SendTo("/queue/showResult")
    public String addNum(String input) throws InterruptedException {
        System.out.println(input);
        return input + "footer";
    }
}