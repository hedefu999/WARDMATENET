package com.wardmate.controller;

import com.wardmate.constant.MessageType;
import com.wardmate.constant.SimpleHttpMessage;
import com.wardmate.constant.WebAppConstant;
import com.wardmate.mapper.IMGroupMapper;
import com.wardmate.model.IMGroup;
import com.wardmate.model.InstantMessage;
import com.wardmate.model.User;
import com.wardmate.serviceInterface.IChatService;
import com.wardmate.serviceInterface.ICommunityService;
import com.wardmate.serviceInterface.INoteBookService;
import com.wardmate.serviceInterface.IUserProfileService;
import com.wardmate.vo.NoteBookQueryResult;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/community")
public class CommunityController {
    private Logger logger = LogManager.getLogger();

    @Autowired
    private ICommunityService communityService;
    @Autowired
    private IChatService chatService;
    @Autowired
    private IUserProfileService profileService;
    @Autowired
    private INoteBookService noteBookService;

    @RequestMapping("/index")
    public String gotoIndex(){
        return "forward:/community/chat";
    }
    @RequestMapping("/chat")
    public String community(HttpSession session, ModelMap modelMap){
        Integer userId = (Integer)session.getAttribute(WebAppConstant.LOGIN_SESSION_ID);
        //查询用户所加群组、好友，初始化页面
        List<IMGroup> myIMGroups = communityService.getMyIMGroups(userId);
        NoteBookQueryResult noteBookQueryResult = noteBookService.getNoteBookPage(userId,1);
        modelMap.put("noteBookQueryResult",noteBookQueryResult);
        modelMap.put("myIMGroups",myIMGroups);
        return "/community/chat";
    }
    @RequestMapping("/playground")
    public String playground(HttpSession session, ModelMap modelMap){
        String myGroupIds = profileService.getMyChatGroup((Integer) session.getAttribute(WebAppConstant.LOGIN_SESSION_ID));
        modelMap.put("myGroupIds",myGroupIds);
        modelMap.put("imGroups",communityService.getAllIMGroup());
        return "/community/playground";
    }

    @ResponseBody
    @RequestMapping("/joinOrLeaveGroup")
    public Map<String,String> joinGroup(Integer currentUserId, Integer groupId){
        Integer resultCode = profileService.joinOrLeaveGroup(currentUserId,groupId);
        Map<String,String> feedback = new HashMap<>();
        if(resultCode == WebAppConstant.USER_JOIN_GROUP){
            feedback.put("operation","join");
            feedback.put("message",SimpleHttpMessage.JOIN_GROUP_SUCCESS);
        }
        if(resultCode == WebAppConstant.USER_LEAVE_GROUP){
            feedback.put("operation","leave");
            feedback.put("message",SimpleHttpMessage.LEAVE_GROUP_SUCCESS);
        }
        return feedback;
    }

    @ResponseBody
    @RequestMapping("/getChatHistory")
    public List<InstantMessage> getChatHistory(Integer toId,String type,Integer pageNo){
        List<InstantMessage> messages = chatService.getChatHistoryByToId(toId,type,pageNo);
        return messages;
    }


}
