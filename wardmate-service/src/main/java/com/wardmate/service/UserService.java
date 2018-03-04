package com.wardmate.service;

import com.wardmate.constant.ServiceConstant;
import com.wardmate.dto.UserAndProfile;
import com.wardmate.mapper.UserMapper;
import com.wardmate.mapper.UserProfileMapper;
import com.wardmate.model.User;
import com.wardmate.model.UserProfile;
import com.wardmate.serviceInterface.IUserService;
import com.wardmate.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService{
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserProfileMapper profileMapper;


    @Override
    public void registerNewUser(User user) {
        userMapper.registerNewUser(user);
        //profileMapper.saveNewProfile();初始化群组，否则会空指针异常
    }

    @Override
    public User getUserByName(String userName) {
        return userMapper.getUserByName(userName);
    }

    @Override
    public UserAndProfile getUserProfileAndSettings(Integer userId) {
        //未来会整合其他设置信息、权限等
        return profileMapper.getUserInformation(userId);
    }

    @Override
    public boolean prepareUserProfile(Integer userId) {
        UserProfile userProfile = profileMapper.getUserProfileByUserId(userId);
        if(userProfile == null){
            userProfile = new UserProfile();
            userProfile.setUserId(userId);
            profileMapper.saveNewProfile(userProfile);
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean checkUserInfo(String name, String password, Integer type) {
        if (type == ServiceConstant.CHECK_USER_PASSWORD_SIMPLE){
            password = MD5.getMD5String(name + MD5.getMD5String(password));
        }
        User user = userMapper.getUserByName(name);
        if (user != null && user.getPassword().equals(password)){
            return true;
        }else {
            return false;
        }
    }
}
