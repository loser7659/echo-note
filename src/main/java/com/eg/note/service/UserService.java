package com.eg.note.service;

import com.eg.note.dao.UserDao;
import com.eg.note.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: Eg
 * @date: 2021/4/9 15:39
 */

@Service
public class UserService {
    @Autowired
    UserDao userDao;
    public User getUserByName(String username){
        return userDao.findByUsername(username);
    }

    public User getUserByUsername(String username){
        return userDao.findByUsername(username);
    }

    public boolean isExist(String username){
        User user = getUserByUsername(username);
        return user!=null;
    }

    public void addUser(User user){
        userDao.save(user);
    }
}
