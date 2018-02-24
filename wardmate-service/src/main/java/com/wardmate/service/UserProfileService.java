package com.wardmate.service;

import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.wardmate.constant.SimpleHttpMessage;
import com.wardmate.constant.WebAppConstant;
import com.wardmate.dto.UserAndProfile;
import com.wardmate.mapper.UserMapper;
import com.wardmate.mapper.UserProfileMapper;
import com.wardmate.model.User;
import com.wardmate.model.UserProfile;
import com.wardmate.serviceInterface.IUserProfileService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserProfileService implements IUserProfileService {
    private Logger logger = LogManager.getLogger();
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserProfileMapper profileMapper;


    @Override
    public void update(UserProfile userProfile) {

    }

    @Override
    public void updateUserInformation(UserAndProfile userAndProfile) {
        User user = new User();
        UserProfile profile = new UserProfile();
        user.setId(userAndProfile.getUserId());
        user.setGender(userAndProfile.getGender());
        user.setBirthday(userAndProfile.getBirthday());
        user.setEmail(userAndProfile.getEmail());
        user.setPhone(userAndProfile.getPhone());

        profile.setUserId(userAndProfile.getUserId());
        profile.setNickName(userAndProfile.getNickName());
        profile.setWeixinAccount(userAndProfile.getWeixinAccount());

        userMapper.updateById(user);
        profileMapper.updateByUserId(profile);
    }

    @Override
    public Integer joinOrLeaveGroup(Integer currentUserId, Integer groupId) {
        Integer operationCode;
        String groupIdString = profileMapper.getGroupIdsByUserId(currentUserId);
        String[] groupIdArray = groupIdString.split(",");
        List<String> groupIdList = Lists.newArrayList(groupIdArray);
        //groupIdString为空时会在Joiner.on()中产生开头逗号，类似 ",2,3"
        //使用Splitter.on(',').omitEmptyStrings().splitToList(groupIdString)可以避免此问题，但不支持remove操作
        //此处解决方法是存储一个不存在的groupId 0，设置为数据库的默认值  2018-02-21
        if(groupIdList.contains(groupId.toString())){
            groupIdList.remove(groupId.toString());
            operationCode = WebAppConstant.USER_LEAVE_GROUP;
        }else {
            groupIdList.add(groupId.toString());
            operationCode = WebAppConstant.USER_JOIN_GROUP;
        }
        groupIdString = Joiner.on(",").skipNulls().join(groupIdList);
        profileMapper.updateGroupIds(groupIdString,currentUserId);
        return operationCode;
    }

    @Override
    public String getMyChatGroup(Integer currentUserId) {
        return profileMapper.getGroupIdsByUserId(currentUserId);
    }


}
