package com.wardmate.mapper;

import com.wardmate.dto.UserAndProfile;
import com.wardmate.model.UserProfile;
import com.wardmate.vo.UserInfo4GroupChat;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

public interface UserProfileMapper {
    UserProfile getUserProfileByUserId(Integer userId);
    void saveNewProfile(UserProfile profile);
    UserAndProfile getUserInforById(Integer userId);
    UserAndProfile getUserInforByName(String userName);
    void updateByUserId(UserProfile profile);
    String getGroupIdsByUserId(Integer userId);
    void updateGroupIds(@Param("groupIds") String groupIds, @Param("userId") Integer userId);
}
