package com.wardmate.service;

import com.google.common.base.Splitter;
import com.wardmate.mapper.IMGroupMapper;
import com.wardmate.mapper.UserProfileMapper;
import com.wardmate.model.IMGroup;
import com.wardmate.serviceInterface.ICommunityService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommunityService implements ICommunityService {
    private Logger logger = LogManager.getLogger();

    @Autowired
    private IMGroupMapper imGroupMapper;
    @Autowired
    private UserProfileMapper userProfileMapper;

    @Override
    public List<IMGroup> getAllIMGroup() {
        return imGroupMapper.getIMGroups();
    }
    @Override
    public List<IMGroup> getMyIMGroups(Integer userId){
        List<IMGroup> myIMGroups = new ArrayList<>();
        String groupIds = userProfileMapper.getGroupIdsByUserId(userId);
        List<IMGroup> allIMGroup = imGroupMapper.getIMGroups();
        //BUG：新注册用户groupIds为空，调用contains出错
        if(groupIds != null && groupIds != ""){
            allIMGroup.stream().forEach(IMGroup->{
                if(groupIds.contains(""+IMGroup.getId())){
                    myIMGroups.add(IMGroup);
                }
            });
        }
        return myIMGroups;
    }
}
