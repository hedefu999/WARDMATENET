package com.wardmate.daoService;

import com.wardmate.daoInterface.IUserProfileDao;
import com.wardmate.dto.UserAndProfile;
import com.wardmate.mapper.UserProfileMapper;
import com.wardmate.model.UserProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserProfileDao implements IUserProfileDao {
    @Autowired
    private UserProfileMapper userProfileMapper;

    @Override
    public UserProfile getUserProfileByUserId(Integer userId) {
        return userProfileMapper.getUserProfileByUserId(userId);
    }

    @Override
    public void saveNewProfile(UserProfile profile) {
        userProfileMapper.saveNewProfile(profile);
    }

    @Override
    public UserAndProfile getUserInformation(Integer userId) {
        return userProfileMapper.getUserInformation(userId);
    }

    @Override
    public void updateByUserId(UserProfile userProfile) {
        userProfileMapper.updateByUserId(userProfile);
    }
}
