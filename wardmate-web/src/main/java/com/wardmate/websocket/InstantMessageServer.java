package com.wardmate.websocket;

import com.wardmate.constant.MessageType;
import com.wardmate.constant.WebAppConstant;
import com.wardmate.model.InstantMessage;
import com.wardmate.serviceInterface.IChatService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.EOFException;
import java.io.IOException;
import java.util.*;

//configurator配置成自定义的ModifiedServerEndpointConfigurator用于让@onOpen获取httpsession
// 此处使用SpringConfigurator 防止@Autowired注解的变量为null，@ServerEndPoint早于Spring容器初始化
@Component
@ServerEndpoint(value = "/instantMessageServer",configurator = ModifiedServerEndpointConfigurator.class)
public class InstantMessageServer{
    private Logger logger = LogManager.getLogger();
    private static Integer onlineUserCount=0;

    //并发情况下安全遍历，使用CopyOnWriteArrayList,是ArrayList的线程安全版本,CopyOnWriteArrayList适合使用在读操作远远大于写操作的场景里
    //private static CopyOnWriteArrayList<InstantMessageServer> websocketServers = new CopyOnWriteArrayList<>();

    //当前用户的ID 、websocket session、http session
    private Integer userId;
    private Session session;
    private HttpSession httpSession;
    //维护一个路由表,服务所有登录用户
    private static Map<Integer,Session> idSessionRouter = new Hashtable<>();
    //群组ID与用户ID列表对照表，供群发消息使用
    private static Map<Integer,ArrayList<Integer>> userGroupMap = new Hashtable<>();

    //在ServerEndpoint中注入bean：https://spring.io/blog/2013/05/23/spring-framework-4-0-m1-websocket-support
    private static IChatService chatService;
    @Autowired
    public InstantMessageServer(IChatService chatService){
        this.chatService = chatService;
    }
    public InstantMessageServer(){}

    @OnOpen
    public void onOpen(Session session, EndpointConfig config){
        this.session = session;
        //HttpSession的命名方法见ModifiedServerEndpointConfigurator
        this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        this.userId = (Integer) httpSession.getAttribute(WebAppConstant.LOGIN_SESSION_ID);
        addOnlineUserCount();
        idSessionRouter.put(userId,session);

        //群发消息的处理方式（兼容P2P）
        //1.依据用户ID查找加入的群组ID
        //2.在群组ID对应的list中添加在线用户ID
        userGroupMap = chatService.prepareGroupID(userId,userGroupMap);
        //在onMessage中处理
        //3.检测到type=GROUP && GROUP ID存在，获取对应的userID list
        //4.依据用户路由表，对这些userID list逐个发送消息
        String broadcast = "用户"+userId+"进入聊天室";
        String message = "";
    }
    @OnClose
    public void onClose() throws EOFException{
        subOnlineUserCount();
        idSessionRouter.remove(userId);
        userGroupMap = chatService.removeUserId(userId,userGroupMap);

        String message = userId+"下线了";
    }
    @OnMessage
    public void onMessage(String messageString){
        //解析消息并存入数据库
        InstantMessage message = chatService.processChatMessage(messageString);
        //发送此消息
        sendChatMessage(message);
    }

    private void sendChatMessage(InstantMessage messageObject){
        String type = messageObject.getType();
        if(type.equals(MessageType.P2P)){
            Integer toId = messageObject.getTo();
            //Session session = idSessionRouter.get(toId);
            //session.getBasicRemote().sendText(messageString);
        }
        //发送群组消息
        if (type.equals(MessageType.GROUP)){
            Integer groupId = messageObject.getTo();
            List<Integer> userIds = userGroupMap.get(groupId);
            String messageToSend = chatService.generateChatMessage(messageObject);
            for(Integer userId : userIds){
                Session session = idSessionRouter.get(userId);
                try {
                    session.getBasicRemote().sendText(messageToSend);
                } catch (IOException e) {
                    e.printStackTrace();
                    continue;
                }
            }
        }
    }

    @OnError
    public void onError(Throwable error){error.printStackTrace();}

    public static Integer getOnlineUserCount() {
        return onlineUserCount;
    }
    public void addOnlineUserCount(){
        InstantMessageServer.onlineUserCount ++;
    }
    public void subOnlineUserCount(){
        InstantMessageServer.onlineUserCount --;
    }

}
