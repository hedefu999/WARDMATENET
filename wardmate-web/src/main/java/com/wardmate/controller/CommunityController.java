package com.wardmate.controller;

import com.wardmate.constant.MessageType;
import com.wardmate.constant.WebAppConstant;
import com.wardmate.mapper.IMGroupMapper;
import com.wardmate.model.IMGroup;
import com.wardmate.model.InstantMessage;
import com.wardmate.model.User;
import com.wardmate.serviceInterface.IChatService;
import com.wardmate.serviceInterface.ICommunityService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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

    @RequestMapping("/index")
    public String gotoIndex(){
        return "forward:/community/chat";
    }
    @RequestMapping("/chat")
    public String community(HttpSession session, ModelMap modelMap){
        Integer userId = (Integer)session.getAttribute(WebAppConstant.LOGIN_SESSION_ID);
        //查询用户所加群组、好友，初始化页面
        List<IMGroup> myIMGroups = communityService.getMyIMGroups(userId);
        modelMap.put("myIMGroups",myIMGroups);
        return "/community/chat";
    }
    @RequestMapping("/playground")
    public String playground(ModelMap modelMap){
        modelMap.put("imGroups",communityService.getAllIMGroup());
        return "/community/playground";
    }

    @ResponseBody
    @RequestMapping("/getChatHistory")
    public List<InstantMessage> getChatHistory(Integer toId,String type,Integer pageNo){
        List<InstantMessage> messages = chatService.getChatHistoryByToId(toId,type,pageNo);
        return messages;
    }

}
