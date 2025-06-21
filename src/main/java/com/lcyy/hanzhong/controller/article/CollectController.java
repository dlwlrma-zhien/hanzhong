package com.lcyy.hanzhong.controller.article;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Collect;
import com.lcyy.hanzhong.service.article.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 收藏：(Collect)表控制层
 *
 */
@RestController
@RequestMapping("collect")
public class CollectController extends BaseController<Collect, CollectService> {
    /**
     * 服务对象
     */
    @Autowired
    public CollectController(CollectService service) {
        setService(service);
    }

}


