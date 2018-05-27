package com.wardmate.serviceInterface;

import com.wardmate.model.InstantMessage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface IChatService {
    Map<Integer,ArrayList<Integer>> prepareGroupID(Integer userId,Map<Integer,ArrayList<Integer>> userGroupMap);
    Map<Integer,ArrayList<Integer>> removeUserId(Integer userId,Map<Integer, ArrayList<Integer>> userGroupMap);
    InstantMessage processChatMessage(String messageString);
    String generateChatMessage(InstantMessage message);

    List<Integer> getSameGroupUserIds(Integer groupId,Map<Integer,ArrayList<Integer>> userGroupMap);
    List<InstantMessage> getChatHistoryByToId(Integer toId,String type,Integer pageNo);
    void initWikiKeywords();
}
