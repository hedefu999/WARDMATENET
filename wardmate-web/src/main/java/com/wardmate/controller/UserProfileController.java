package com.wardmate.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.wardmate.constant.ServiceConstant;
import com.wardmate.dto.UserAndProfile;
import com.wardmate.model.User;
import com.wardmate.serviceInterface.IUserProfileService;
import com.wardmate.serviceInterface.IUserService;
import com.wardmate.vo.FeedbackMessage;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userProfile")
public class UserProfileController {
    private Logger logger = LogManager.getLogger();
    @Autowired
    private IUserProfileService userProfileService;
    @Autowired
    private IUserService userService;

    @ResponseBody
    @RequestMapping("/updateProfile")
    public String saveChanges(@RequestBody UserAndProfile userAndProfile){
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        boolean checkIdentity = userService.checkUserInfo(userAndProfile.getName(),userAndProfile.getPassword(),
                ServiceConstant.CHECK_USER_PASSWORD_SIMPLE);
        if (checkIdentity){
            userProfileService.updateUserInformation(userAndProfile);
            return "success";
        }else {
            return "false";
        }
    }

    @ResponseBody
    @RequestMapping(value="/testAjax",method = RequestMethod.POST)
    public Map<String, FeedbackMessage> testAjax(@RequestBody List<User> users){
        logger.info(users);
        FeedbackMessage message = new FeedbackMessage();
        message.setTitle("finished");
        message.setContent("test ajax");
        Map<String,FeedbackMessage> messageMap = Maps.newHashMap();
        messageMap.put("first",message);
        message = new FeedbackMessage();
        message.setTitle("producing");
        message.setContent("something unexpected happened");
        messageMap.put("second",message);
        return messageMap;
    }
    @ResponseBody
    @RequestMapping("/testAjax2")
    public List<FeedbackMessage> testAjax2(@RequestBody Map<String,User> userMap){
        logger.info(userMap);
        List<FeedbackMessage> messages = Lists.newArrayList();
        FeedbackMessage message = new FeedbackMessage();
        message.setTitle("finished");
        message.setContent("test ajax");
        messages.add(message);
        message = new FeedbackMessage();
        message.setTitle("producing");
        message.setContent("something unexpected happened");
        messages.add(message);
        return messages;
    }

}
