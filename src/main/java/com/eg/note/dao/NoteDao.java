package com.eg.note.dao;

import com.eg.note.pojo.Category;
import com.eg.note.pojo.Note;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author: Eg
 * @date: 2021/4/13 14:18
 */
public interface NoteDao extends JpaRepository<Note,Integer> {
    List<Note> findAllByCategory(Category category);
}
