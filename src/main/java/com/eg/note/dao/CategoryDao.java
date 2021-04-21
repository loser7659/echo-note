package com.eg.note.dao;

import com.eg.note.pojo.Category;
import com.eg.note.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author: Eg
 * @date: 2021/4/12 16:26
 */
public interface CategoryDao extends JpaRepository<Category,Integer> {
    List<Category> findByAuthor(User author);
}
