package com.wardmate.daoInterface;

import com.wardmate.dto.UserAndProfile;
import com.wardmate.model.UserProfile;

public interface IUserProfileDao {
    UserProfile getUserProfileByUserId(Integer userId);
    void saveNewProfile(UserProfile profile);
    UserAndProfile getUserInformation(Integer userId);
    void updateByUserId(UserProfile userProfile);
}
