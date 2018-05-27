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
        UserProfile userProfile = new UserProfile();
        userProfile.setUserId(user.getId());
        userProfile.setNickName(user.getName());
        //新注册用户应同步插入profile数据，否则无法加群
        profileMapper.saveNewProfile(userProfile);
    }

    @Override
    public UserAndProfile getFullUserByName(String userName) {
        return profileMapper.getUserInforByName(userName);
    }

    @Override
    public UserAndProfile getUserProfileAndSettings(Integer userId) {
        //未来会整合其他设置信息、权限等
        return profileMapper.getUserInforById(userId);
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
