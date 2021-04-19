package com.eg.note.Controller;

import com.eg.note.pojo.User;
import com.eg.note.response.Response;
import com.eg.note.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;

/**
 * @author: Eg
 * @date: 2021/4/9 15:41
 */
@Api(description ="用户管理API")
@RestController
@CrossOrigin
@RequestMapping("/api")
public class UserController {
    @Autowired
    UserService userService;

    /**
     * @Description 注册
     * @param user
     * @author:  Eg
     * @Date: 2021/4/13/
     */
    @ApiOperation("注册")
    @PostMapping("/register")
    @ResponseBody
    public String Register(@RequestBody User user){
        String username = user.getUsername();
        username = HtmlUtils.htmlEscape(username);
        user.setUsername(username);
        String password = user.getPassword();

        boolean isExist = userService.isExist(username);
        if(isExist){
            return "用户名已存在";
        }
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        int times = 2;
        String algorithm = "md5";
        String pwdAfterHash = new SimpleHash(algorithm,password,salt,times).toString();
        user.setSalt(salt);
        user.setPassword(pwdAfterHash);
        userService.addUser(user);
        return "注册成功";
    }

    /**
     * @Description 登录
     * @param user
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @ApiOperation("登录")
    @PostMapping("/login")
    @ResponseBody
    public Response login(@RequestBody User user){
        String username = user.getUsername();
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, user.getPassword());

        try{
            subject.login(usernamePasswordToken);
            return new Response(200,"sucess",usernamePasswordToken);
        }catch (AuthenticationException e){
            return new Response(500,"failure",null);
        }

    }

    /**
     * @Description 注销登录
     * @author:  Eg
     * @Date: 2021/4/15/
     */
    @ApiOperation("注销")
    @GetMapping("/logout")
    @ResponseBody
    public Response logout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return new Response(200,"注销成功",null);
    }
}
