package com.lcyy.hanzhong.controller.notice;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Notice;
import com.lcyy.hanzhong.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 公告：(Notice)表控制层
 *
 */
@RestController
@RequestMapping("notice")
public class NoticeController extends BaseController<Notice, NoticeService> {
    /**
     * 服务对象
     */
    @Autowired
    public NoticeController(NoticeService service) {
        setService(service);
    }

}


