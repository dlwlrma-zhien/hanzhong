package com.lcyy.hanzhong.controller.forum;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.ForumType;
import com.lcyy.hanzhong.service.forum.ForumTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 论坛频道：用于汇总浏览论坛，在不同频道下展示不同论坛。(ForumType)表控制层
 *
 */
@RestController
@RequestMapping("forum_type")
public class ForumTypeController extends BaseController<ForumType, ForumTypeService> {
    /**
     * 服务对象
     */
    @Autowired
    public ForumTypeController(ForumTypeService service) {
        setService(service);
    }

}


