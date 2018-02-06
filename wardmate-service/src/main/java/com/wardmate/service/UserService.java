package com.wardmate.service;

import com.wardmate.constant.ServiceConstant;
import com.wardmate.daoInterface.IUserDao;
import com.wardmate.daoInterface.IUserProfileDao;
import com.wardmate.dto.UserAndProfile;
import com.wardmate.model.User;
import com.wardmate.model.UserProfile;
import com.wardmate.serviceInterface.IUserService;
import com.wardmate.utils.CheckSumBuilder;
import com.wardmate.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService{
    @Autowired
    private IUserDao userDao;
    @Autowired
    private IUserProfileDao userProfileDao;

    @Override
    public void registerNewUser(User user) {
        userDao.registerNewUser(user);
    }

    @Override
    public User getUserByName(String userName) {
        return userDao.getUserByName(userName);
    }

    @Override
    public UserAndProfile getUserProfileAndSettings(Integer userId) {
        //未来会整合其他设置信息、权限等
        return userProfileDao.getUserInformation(userId);
    }

    @Override
    public boolean prepareUserProfile(Integer userId) {
        UserProfile userProfile = userProfileDao.getUserProfileByUserId(userId);
        if(userProfile == null){
            userProfile = new UserProfile();
            userProfile.setUserId(userId);
            userProfileDao.saveNewProfile(userProfile);
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
        User user = userDao.getUserByName(name);
        if (user != null && user.getPassword().equals(password)){
            return true;
        }else {
            return false;
        }
    }
}
