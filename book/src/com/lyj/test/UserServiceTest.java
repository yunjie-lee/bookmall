package com.lyj.test;

import com.lyj.pojo.User;
import com.lyj.service.UserService;
import com.lyj.service.impl.UserServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserServiceTest {

    UserService userService = new UserServiceImpl();

    @Test
    public void registUser() {
        userService.registUser(new User(null,"bbj","123344","bbj@qq.com"));
        userService.registUser(new User(null,"abc","123344","abc@qq.com"));
    }

    @Test
    public void login() {
        System.out.println(userService.login(new User(null,"abc","123344","abc@qq.com")));
    }

    @Test
    public void existsUsername() {
        if(userService.existsUsername("abc123")){
            System.out.println("用户名已存在");
        }else{
            System.out.println("用户名可用");
        }
    }
}