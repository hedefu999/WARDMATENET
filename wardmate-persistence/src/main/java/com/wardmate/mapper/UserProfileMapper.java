package com.wardmate.mapper;

import com.wardmate.dto.UserAndProfile;
import com.wardmate.model.UserProfile;
import org.apache.ibatis.annotations.Param;

public interface UserProfileMapper {
    UserProfile getUserProfileByUserId(Integer userId);
    void saveNewProfile(UserProfile profile);
    UserAndProfile getUserInformation(Integer userId);
    void updateByUserId(UserProfile profile);
    String getGroupIdsByUserId(Integer userId);
    void updateGroupIds(@Param("groupIds") String groupIds, @Param("userId") Integer userId);
}
