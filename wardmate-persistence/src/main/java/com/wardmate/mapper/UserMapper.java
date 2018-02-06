package com.wardmate.mapper;

import com.wardmate.model.User;

import java.util.List;

public interface UserMapper {
    List<User> getUserList();
    User getUserNameAndPassword(String userName);
    User getUserByName(String userName);
    void registerNewUser(User user);
    void updateById(User user);
}
