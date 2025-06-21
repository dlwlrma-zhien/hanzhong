package com.lcyy.hanzhong.controller.user;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Auth;
import com.lcyy.hanzhong.service.article.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author dlwlrma
 * @date 2025/6/21 16:06
 */
@RestController
@RequestMapping("auth")
public class AuthController extends BaseController<Auth, AuthService> {
    /**
     * 服务对象
     */
    @Autowired
    public AuthController(AuthService service) {
        setService(service);
    }

}


