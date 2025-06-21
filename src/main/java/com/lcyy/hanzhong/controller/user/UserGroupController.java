package com.lcyy.hanzhong.controller.user;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.UserGroup;
import com.lcyy.hanzhong.service.user.UserGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: dlwlrma
 * @data 2025年06月21日 15:12
 * @Description 用户组：用于用户前端身份和鉴权(UserGroup)表控制层
 */
@RestController
@RequestMapping("user_group")
public class UserGroupController extends BaseController<UserGroup, UserGroupService> {
    @Autowired
    public UserGroupController(UserGroupService service) {
        setService(service);
    }
}
