package com.lcyy.hanzhong.controller;

import com.alibaba.fastjson.JSONObject;
import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.AccessToken;
import com.lcyy.hanzhong.entity.User;
import com.lcyy.hanzhong.entity.UserGroup;
import com.lcyy.hanzhong.service.AccessTokenService;
import com.lcyy.hanzhong.service.UserGroupService;
import com.lcyy.hanzhong.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


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

    @Autowired
    private UserGroupService userGroupService;

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

    //找回密码
    @PostMapping("/forget_password")
    public Map<String,Object> forgetPassword(@RequestBody User user, HttpServletRequest request){
        String code = user.getCode();
        String username = user.getUsername();
        String password = user.getPassword();
        if(StringUtils.isEmpty(code)){
            return error(400,"验证码错误");
        }
        if(StringUtils.isEmpty(username)){
            return error(400,"用户名错误");
        }
        if(StringUtils.isEmpty(password)){
            return error(400,"密码错误");
        }

        //查询用户
        Map<String, String> map = new HashMap<>();
        map.put("username",username);
        Query select = service.select(map, service.readConfig(request));
        List list = select.getResultList();
        if(list.size() > 0){
            User u = (User)list.get(0);
            JSONObject object = new JSONObject();
            JSONObject object1 = new JSONObject();
            object.put("user_id",user.getUserId());
            object1.put("password",service.encryption(password));
            //更新用户
            service.update(map,service.readConfig(request),object1);
            return success(200);
        }
        return error(400,"请重新操作");
    }

    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Map<String,String> data, HttpServletRequest request){
        String username = data.get("username");
        String password = data.get("password");
        String email = data.get("email");
        String phone = data.get("phone");

        List resultList = null;
        Map<String, String> map = new HashMap<>();
        if(username != null && "".equals(username) == false){
            map.put("username", username);
            resultList = service.select(map, new HashMap<>()).getResultList();
        }
        else if(email != null && "".equals(email) == false){
            map.put("email", email);
            resultList = service.select(map, new HashMap<>()).getResultList();
        }
        else if(phone != null && "".equals(phone) == false){
            map.put("phone", phone);
            resultList = service.select(map, new HashMap<>()).getResultList();
        }else{
            return error(30000, "账号或密码不能为空");
        }
        if (resultList == null || password == null) {
            return error(30000, "账号或密码不能为空");
        }
        //判断是否有这个用户
        if (resultList.size()<=0){
            return error(30000,"用户不存在");
        }

        User byUsername = (User) resultList.get(0);


        Map<String, String> groupMap = new HashMap<>();
        groupMap.put("name",byUsername.getUserGroup());
        List groupList = userGroupService.select(groupMap, new HashMap<>()).getResultList();
        if (groupList.size()<1){
            return error(30000,"用户组不存在");
        }

        UserGroup userGroup = (UserGroup) groupList.get(0);

        //查询用户审核状态
        if (!StringUtils.isEmpty(userGroup.getSourceTable())){
            String sql = "select examine_state from "+ userGroup.getSourceTable() +" WHERE user_id = " + byUsername.getUserId();
            String res = String.valueOf(service.runCountSql(sql).getSingleResult());
            if (res==null){
                return error(30000,"用户不存在");
            }
            if (!res.equals("已通过")){
                return error(30000,"该用户审核未通过");
            }
        }

        //查询用户状态
        if (byUsername.getState()!=1){
            return error(30000,"用户非可用状态，不能登录");
        }

        String md5password = service.encryption(password);
        if (byUsername.getPassword().equals(md5password)) {
            // 存储Token到数据库
            AccessToken accessToken = new AccessToken();
            accessToken.setToken(UUID.randomUUID().toString().replaceAll("-", ""));
            accessToken.setUser_id(byUsername.getUserId());
            tokenService.save(accessToken);

            // 返回用户信息
            JSONObject user = JSONObject.parseObject(JSONObject.toJSONString(byUsername));
            user.put("token", accessToken.getToken());
            JSONObject ret = new JSONObject();
            ret.put("obj",user);
            return success(ret);
        } else {
            return error(30000, "账号或密码不正确");
        }
    }
}
