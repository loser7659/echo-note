package com.eg.note.Controller;

import com.eg.note.pojo.Category;
import com.eg.note.pojo.Note;
import com.eg.note.pojo.User;
import com.eg.note.response.Response;
import com.eg.note.service.CategoryService;
import com.eg.note.service.NoteService;
import io.swagger.annotations.Api;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;

/**
 * @author: Eg
 * @date: 2021/4/12 16:29
 */
@Api(description ="笔记管理API")
@RestController
@CrossOrigin
@RequestMapping("/api")
public class NoteController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    NoteService noteService;

    /**
     * @Description 获取笔记分类
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @GetMapping("/categories")
    @ResponseBody
    public List<Category> getCatesgoryList(){
        return categoryService.getAll();
    }

    /**
     * @Description 通过分类id获取笔记
     * @param id
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @GetMapping("/categories/{id}/notes")
    @ResponseBody
    public List<Note> getNotesByCategory(@PathVariable("id") int id){
        return noteService.getNotesByCategory(id);
    }

    /**
     * @Description 通过id删除笔记分类
     * @param id
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @GetMapping("/category/delete/{id}")
    @ResponseBody
    public Response deleteCategory(@PathVariable("id") int id){
        categoryService.deleteById(id);
        return new Response(200,"成功",null);
    }

    /**
     * @Description 新增笔记分类
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @PostMapping("/category/add")
    @ResponseBody
    public Response addCategory(@RequestBody Category requestCategory){
        Category category = new Category();
        category.setName(requestCategory.getName());
        categoryService.updateCategory(category);
        return new Response(200,"成功",null);
    }

    /**
     * @Description 更新分类信息
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @PostMapping("/category/update")
    @ResponseBody
    public Response updateCategory(@RequestBody Category requestCategory){
        Category category = categoryService.getById(requestCategory.getId());
        category.setName(requestCategory.getName());
        categoryService.updateCategory(category);
        return new Response(200,"成功",null);
    }


    /**
     * @Description 更新笔记信息
     * @param id
     * @param requestNote
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @PostMapping("/update/{type}/note/{id}")
    @ResponseBody
    public Response updateNoteInfo(@RequestBody Note requestNote, @PathVariable("id") int id,@PathVariable("type") String type){
        Note note = noteService.getById(id);
        if(type.equals("info")){
            note.setName(requestNote.getName());
            note.setAbs(requestNote.getAbs());
        }else if(type.equals("content")){
            note.setContentHtml(requestNote.getContentHtml());
            note.setContentMd(requestNote.getContentMd());
        }
        note.setLastModifiedTime(new Timestamp(System.currentTimeMillis()));
        noteService.updateNote(note);

        return new Response(200,"成功",null);
    }

    /**
     * @Description 新增笔记
     * @param id
     * @param requestNote
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @PostMapping("/update/category/{id}/note/add")
    @ResponseBody
    public Response addNote(@RequestBody Note requestNote,@PathVariable("id") int id){
        Note note = new Note();
        note.setName(requestNote.getName());
        note.setAbs(requestNote.getAbs());
        Category category = categoryService.getById(id);
        note.setCategory(category);
        note.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        note.setLastModifiedTime(new Timestamp(System.currentTimeMillis()));
        noteService.updateNote(note);
        return new Response(200,"成功",null);
    }

    /**
     * @Description 通过分类id删除笔记
     * @param id
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @GetMapping("/note/delete/{id}")
    @ResponseBody
    public Response deleteNote(@PathVariable("id") int id){
        noteService.deleteById(id);
        return new Response(200,"成功",null);
    }

    /**
     * @Description 通过笔记id获取笔记
     * @param id
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @GetMapping("/note/{id}")
    @ResponseBody
    public Response getNote(@PathVariable("id") int id){
        Note note = noteService.getById(id);
        return new Response(200,"获取成功",note);
    }
}
