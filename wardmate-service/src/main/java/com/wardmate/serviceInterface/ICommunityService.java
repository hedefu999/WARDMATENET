package com.wardmate.serviceInterface;

import com.wardmate.model.IMGroup;

import java.util.List;

public interface ICommunityService {
    List<IMGroup> getAllIMGroup();
    List<IMGroup> getMyIMGroups(Integer userId);
}
