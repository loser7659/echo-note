package com.eg.note.service;

import com.eg.note.dao.CategoryDao;
import com.eg.note.dao.NoteDao;
import com.eg.note.pojo.Category;
import com.eg.note.pojo.Note;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Eg
 * @date: 2021/4/13 14:17
 */

@Service
public class NoteService {

    @Autowired
    NoteDao noteDao;
    @Autowired
    CategoryDao categoryDao;

    public List<Note> getAll(){
        return noteDao.findAll(Sort.by(Sort.Direction.DESC,"id"));
    }

    public List<Note> getNotesByCategory(int id){
        Category one = categoryDao.getOne(id);
        return noteDao.findAllByCategory(one);
    }

    public Note getById(int id){
        return noteDao.findById(id).get();
    }

    public void updateNote(Note note){
        noteDao.save(note);
    }

    public void deleteById(int id){
        noteDao.deleteById(id);
    }
}
