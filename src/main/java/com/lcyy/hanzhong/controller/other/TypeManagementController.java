package com.lcyy.hanzhong.controller.other;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.TypeManagement;
import com.lcyy.hanzhong.service.other.TypeManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;


/**
 *类型管理：(TypeManagement)表控制层
 *
 */
@RestController
@RequestMapping("/type_management")
public class TypeManagementController extends BaseController<TypeManagement,TypeManagementService> {

    /**
     *类型管理对象
     */
    @Autowired
    public TypeManagementController(TypeManagementService service) {
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
