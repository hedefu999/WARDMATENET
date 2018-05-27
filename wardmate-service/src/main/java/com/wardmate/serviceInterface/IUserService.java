package com.wardmate.serviceInterface;

import com.wardmate.dto.UserAndProfile;
import com.wardmate.model.User;

public interface IUserService {
    void registerNewUser(User user);
    UserAndProfile getFullUserByName(String userName);
    UserAndProfile getUserProfileAndSettings(Integer userId);

    boolean prepareUserProfile(Integer userId);
    boolean checkUserInfo(String name,String password,Integer type);
}
