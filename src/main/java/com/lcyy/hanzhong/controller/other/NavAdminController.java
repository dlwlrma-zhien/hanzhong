package com.lcyy.hanzhong.controller.other;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.NavAdmin;
import com.lcyy.hanzhong.service.other.NavAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * (NavAdmin)表控制层
 *
 */
@RestController
@RequestMapping("nav_admin")
public class NavAdminController extends BaseController<NavAdmin, NavAdminService> {
    /**
     * 服务对象
     */
    @Autowired
    public NavAdminController(NavAdminService service) {
        setService(service);
    }

}


