package com.lcyy.hanzhong.controller.forum;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Hits;
import com.lcyy.hanzhong.service.forum.HitsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 点赞：(Hits)表控制层
 */
@RestController
@RequestMapping("hits")
public class HitsController extends BaseController<Hits, HitsService> {
    /**
     * 服务对象
     */
    @Autowired
    public HitsController(HitsService service) {
        setService(service);
    }

}


