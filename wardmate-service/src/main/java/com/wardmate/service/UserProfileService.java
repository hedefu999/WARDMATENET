package com.wardmate.service;

import com.wardmate.dto.UserAndProfile;
import com.wardmate.mapper.UserMapper;
import com.wardmate.mapper.UserProfileMapper;
import com.wardmate.model.User;
import com.wardmate.model.UserProfile;
import com.wardmate.serviceInterface.IUserProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserProfileService implements IUserProfileService {
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
}
