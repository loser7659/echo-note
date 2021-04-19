package com.eg.note.dao;

import com.eg.note.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author: Eg
 * @date: 2021/4/9 15:38
 */
public interface UserDao extends JpaRepository<User,Integer> {
    User findByUsername(String username);
}
