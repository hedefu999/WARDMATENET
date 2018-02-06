package com.wardmate.daoService;


import com.wardmate.mapper.UserMapper;
import com.wardmate.model.User;
import com.wardmate.daoInterface.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class UserDao implements IUserDao {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    @Override
    public User getUserNameAndPassword(String userName) {
        return userMapper.getUserNameAndPassword(userName);
    }

    @Override
    public User getUserByName(String userName) {
        return userMapper.getUserByName(userName);
    }

    @Override
    public void registerNewUser(User user) {
        userMapper.registerNewUser(user);
    }

    @Override
    public void updateById(User user) {
        userMapper.updateById(user);
    }


}
