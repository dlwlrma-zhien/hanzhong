package com.lcyy.hanzhong.controller.home;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Slides;
import com.lcyy.hanzhong.service.home.SlidesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 轮播图：(Slides)表控制层
 *
 */
@RestController
@RequestMapping("slides")
public class SlidesController extends BaseController<Slides, SlidesService> {
    /**
     * 服务对象
     */
    @Autowired
    public SlidesController(SlidesService service) {
        setService(service);
    }

}


