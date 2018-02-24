package com.wardmate.mapper;

import com.wardmate.model.InstantMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GroupChatMapper {
    void saveGroupChat(InstantMessage message);
    List<InstantMessage> getInstantMessageByToId(@Param("toId") Integer toId, @Param("offset") Integer offset);
}
