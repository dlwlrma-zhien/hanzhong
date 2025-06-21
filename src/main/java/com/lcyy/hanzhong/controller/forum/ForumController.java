package com.lcyy.hanzhong.controller.forum;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Forum;
import com.lcyy.hanzhong.service.forum.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.sun.deploy.services.ServiceManager.setService;

/**
 * 论坛：(Forum)表控制层
 *
 */
@RestController
@RequestMapping("forum")
public class ForumController extends BaseController<Forum, ForumService> {
    /**
     * 服务对象
     */
    @Autowired
    public ForumController(ForumService service) {
        setService(service);
    }

}


