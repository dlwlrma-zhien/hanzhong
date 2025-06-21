package com.lcyy.hanzhong.controller.other;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Upload;
import com.lcyy.hanzhong.service.other.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * (Upload)表控制层
 *
 */
@RestController
@RequestMapping("upload")
public class UploadController extends BaseController<Upload, UploadService> {
    /**
     * 服务对象
     */
    @Autowired
    public UploadController(UploadService service) {
        setService(service);
    }

}


