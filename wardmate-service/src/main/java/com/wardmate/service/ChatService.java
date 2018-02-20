package com.wardmate.service;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.base.Splitter;
import com.wardmate.constant.MessageType;
import com.wardmate.constant.WebAppConstant;
import com.wardmate.mapper.GroupChatMapper;
import com.wardmate.mapper.P2PChatMapper;
import com.wardmate.mapper.UserProfileMapper;
import com.wardmate.model.InstantMessage;
import com.wardmate.serviceInterface.IChatService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ChatService implements IChatService {
    private Logger logger = LogManager.getLogger();
    private static ObjectMapper mapper = new ObjectMapper();//jackson 使用 databinding方式解析JSON
    @Autowired
    private GroupChatMapper groupChatMapper;
    @Autowired
    private P2PChatMapper p2PChatMapper;
    @Autowired
    private UserProfileMapper userProfileMapper;

    @Override
    public Map<Integer, ArrayList<Integer>> prepareGroupID(Integer userId, Map<Integer, ArrayList<Integer>> userGroupMap) {
        String groupIdsString = userProfileMapper.getGroupIdsByUserId(userId);
        if (groupIdsString == null || groupIdsString.equals("")){
            //此人没有加入任何群
            return userGroupMap;
        }
        List<String> groupIds = Splitter.on(',').omitEmptyStrings().splitToList(groupIdsString);
        logger.info("userId = "+userId+" , grouIds = "+groupIds);
        if(groupIds != null && groupIds.size() != 0){
            for(String groupIdString : groupIds){
                Integer groupId = Integer.parseInt(groupIdString);
                ArrayList<Integer> currentUserIds;
                if(userGroupMap.containsKey(groupId)){
                    currentUserIds = userGroupMap.get(groupId);
                    if(!currentUserIds.contains(userId)){
                        currentUserIds.add(userId);
                    }
                }else {
                    currentUserIds = new ArrayList<>();
                    currentUserIds.add(userId);
                }
                userGroupMap.put(groupId,currentUserIds);
            }
        }
        return userGroupMap;
    }

    @Override
    public Map<Integer, ArrayList<Integer>> removeUserId(Integer userId,Map<Integer, ArrayList<Integer>> userGroupMap) {
        for(Map.Entry<Integer, ArrayList<Integer>> entry : userGroupMap.entrySet()){
            ArrayList<Integer> userIds = entry.getValue();
            userIds.remove(new Integer(userId));//不存在此ID应该不会引发bug
            userGroupMap.put(entry.getKey(),userIds);//覆盖操作
        }
        return userGroupMap;
    }

    private void checkCurrentuserGroupMap(Map<Integer, ArrayList<Integer>> userGroupMap){
        for(Map.Entry<Integer, ArrayList<Integer>> entry : userGroupMap.entrySet()){
            logger.info("groupId = "+entry.getKey()+" , userId list = "+entry.getValue());
        }
    }

    public InstantMessage processChatMessage(String messageString){
        //1.收到消息先解析
        InstantMessage messageObject=null;
        //忽略为空属性
        mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
        try {
            messageObject = mapper.readValue(messageString,InstantMessage.class);
            System.out.println("收到消息： "+messageObject);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (messageObject != null){
            //2.保存消息对象
            String type = messageObject.getType();
            if(type.equals(MessageType.GROUP)){
                groupChatMapper.saveGroupChat(messageObject);
            }
            if (type.equals(MessageType.P2P)){
                p2PChatMapper.saveP2pChat(messageObject);
            }
        }
        return messageObject;
    }

    public String generateChatMessage(InstantMessage message){
        //mapper.configure(SerializationFeature.INDENT_OUTPUT, true);格式化JSON使之易读
        //配置mapper忽略空属性
        mapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
        try {
            return mapper.writeValueAsString(message);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "{}";
        }
    }

    @Override
    public List<InstantMessage> getChatHistoryByToId(Integer toId, String type,Integer pageNo) {
        List<InstantMessage> messages = new ArrayList<>();
        if(type.equals(MessageType.GROUP)){
            messages = groupChatMapper.getInstantMessageByToId(toId,(pageNo-1)*10);
        }
        if (type.equals(MessageType.P2P)){

        }

        return messages;
    }


    //产生用户登录后的群组提醒
    public List<Integer> getSameGroupUserIds(Integer userId,Map<Integer,ArrayList<Integer>> userGroupMap) {
        List<Integer> targetUserIds = new ArrayList<>();
        for(Map.Entry<Integer,ArrayList<Integer>> entry : userGroupMap.entrySet()){
            List<Integer> sameGroupUserList = entry.getValue();
            if(sameGroupUserList.contains(userId)){
                for(Integer tempUserId : sameGroupUserList){
                    if(!targetUserIds.contains(userId)){
                        targetUserIds.add(tempUserId);
                    }
                }
            }
        }
        return targetUserIds;
    }

    public String generateGroupNotification(){
        InstantMessage instantMessage = new InstantMessage();
        instantMessage.setFrom(0);
        instantMessage.setTo(11);
        instantMessage.setMessage("");
        instantMessage.setType("");
        //mapper.configure(SerializationFeature.INDENT_OUTPUT, true);格式化JSON使之易读
        //配置mapper忽略空属性
        mapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
        try {
            return mapper.writeValueAsString(instantMessage);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "{}";
        }
    }

}
