package com.lcyy.hanzhong.controller;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.User;
import com.lcyy.hanzhong.service.AccessTokenService;
import com.lcyy.hanzhong.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author: dlwlrma
 * @data 2025年06月19日 22:15
 * @Description 用户接口
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController extends BaseController<User, UserService> {

    //注入UserService
    @Autowired
    public UserController(UserService service) {
        setService(service);
    }

    //注入Token
    @Autowired
    private AccessTokenService tokenService;

    //注册
    @PostMapping("/register")
    public Map<String,Object> signUp(@RequestBody User user){
        HashMap<String, String> map = new HashMap<>();
        map.put("username",user.getUsername());
        List list = service.select(map,new HashMap<>()).getResultList();
        user.setUserId(null);
        user.setPassword(service.encryption(user.getPassword()));
        service.save(user);
        return success(1);
    }
}
