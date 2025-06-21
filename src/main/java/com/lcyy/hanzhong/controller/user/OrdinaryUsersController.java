package com.lcyy.hanzhong.controller.user;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.OrdinaryUsers;
import com.lcyy.hanzhong.service.user.OrdinaryUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;


/**
 *普通用户：(OrdinaryUsers)表控制层
 *
 */
@RestController
@RequestMapping("/ordinary_users")
public class OrdinaryUsersController extends BaseController<OrdinaryUsers,OrdinaryUsersService> {

    /**
     *普通用户对象
     */
    @Autowired
    public OrdinaryUsersController(OrdinaryUsersService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    @Override
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
