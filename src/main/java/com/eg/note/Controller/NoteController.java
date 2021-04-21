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
import org.springframework.beans.factory.annotation.Value;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.servlet.http.HttpServletRequest;
import java.io.File;

import java.sql.Timestamp;

import java.text.SimpleDateFormat;
import java.util.*;

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
        Subject subject = SecurityUtils.getSubject();
        User user = (User)subject.getPrincipal();
        return categoryService.getAllByUser(user);
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
        Subject subject = SecurityUtils.getSubject();
        Category category = new Category();
        category.setName(requestCategory.getName());
        category.setAuthor((User)subject.getPrincipal());
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
        Subject subject = SecurityUtils.getSubject();
        Note note = new Note();
        note.setAuthor((User)subject.getPrincipal());
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


    final static String PIC_PATH = "static/images/";

    /**
     * @Description 图片上传并回显
     * @author:  Eg
     * @Date: 2021/4/21/
     */
    @PostMapping("/upload")
    @ResponseBody
//    public Response uploadPic(MultipartHttpServletRequest multiRequest, HttpServletRequest request){
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //生成日期格式
//        String datePrefix = dateFormat.format(new Date()); //生成当前日期作为前缀
//        String savePath = "src/main/resources/" + PIC_PATH; // 存储路径
//
//        File folder = new File(savePath+datePrefix); //生成带当前日期的文件路径
//
//        if(!folder.isDirectory()){
//            folder.mkdirs();
//        }
//
//        String randomName = multiRequest.getFile("image").getOriginalFilename(); //获取图片名
//        //生成随机数确保唯一性，并加上图片后缀
//        String saveName = UUID.randomUUID().toString() + randomName.substring(randomName.lastIndexOf("."),randomName.length());
//        String absolutePath = folder.getAbsolutePath(); //转换成绝对路径
//
//        try {
//            File fileToSave = new File(absolutePath + File.separator + saveName);
//            multiRequest.getFile("image").transferTo(fileToSave); //图片存储到服务端
//            String returnPath = request.getScheme() + "://"
//                    + request.getServerName()+":"+request.getServerPort()
//                    + "/images/" + datePrefix +"/"+ saveName;
//
//            return new Response(200,"上传成功",returnPath);
//
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return new Response(500,"上传失败",null);
//    }
    public Response uploadPic(MultipartHttpServletRequest multiRequest, HttpServletRequest request){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String datePrefix = dateFormat.format(new Date());
        String savePath = "src/main/resources/"+PIC_PATH;

        File folder = new File(savePath+datePrefix);
        if(!folder.isDirectory()){
            folder.mkdirs();
        }
        String originalName = multiRequest.getFile("image").getOriginalFilename();
        String saveName = UUID.randomUUID().toString() + originalName.substring(originalName.lastIndexOf("."),originalName.length());
        String absolutePath = folder.getAbsolutePath();

        try{
            File fileToSave = new File(absolutePath + File.separator + saveName);
            multiRequest.getFile("image").transferTo(fileToSave);
            String returnPath = request.getScheme() + "://"
                    + request.getServerName()+":"+request.getServerPort()
                    +"/article/images/"
                    + datePrefix +"/"+ saveName;

            return new Response(200,"上传成功",returnPath);
        }catch (Exception e){
            e.printStackTrace();
        }
        return new Response(500,"上传失败",null);

    }

}
