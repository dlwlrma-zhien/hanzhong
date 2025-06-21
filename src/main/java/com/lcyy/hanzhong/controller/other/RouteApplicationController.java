package com.lcyy.hanzhong.controller.other;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.RouteApplication;
import com.lcyy.hanzhong.service.other.RouteApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;


/**
 *路线申请：(RouteApplication)表控制层
 *
 */
@RestController
@RequestMapping("/route_application")
public class RouteApplicationController extends BaseController<RouteApplication,RouteApplicationService> {

    /**
     *路线申请对象
     */
    @Autowired
    public RouteApplicationController(RouteApplicationService service) {
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
