package com.eg.note.service;

import com.eg.note.dao.CategoryDao;
import com.eg.note.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Eg
 * @date: 2021/4/12 16:27
 */
@Service
public class CategoryService {

    @Autowired
    CategoryDao categoryDao;

    public List<Category> getAll(){
        return categoryDao.findAll(Sort.by(Sort.Direction.DESC,"id"));
    }

    public void deleteById(int id){
        categoryDao.deleteById(id);
    }

    public Category getById(int id){
        return categoryDao.findById(id).get();
    }

    public void updateCategory(Category category){
        categoryDao.save(category);
    }


}
