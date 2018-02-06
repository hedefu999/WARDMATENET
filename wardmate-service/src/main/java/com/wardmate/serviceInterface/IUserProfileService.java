package com.wardmate.serviceInterface;

import com.wardmate.dto.UserAndProfile;
import com.wardmate.model.UserProfile;

public interface IUserProfileService {
    void update(UserProfile userProfile);

    void updateUserInformation(UserAndProfile userAndProfile);
}
