package com.lcyy.hanzhong.controller.scenic;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.ScenicSpotInformation;
import com.lcyy.hanzhong.service.senic.ScenicSpotInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;


/**
 *景点信息：(ScenicSpotInformation)表控制层
 *
 */
@RestController
@RequestMapping("/scenic_spot_information")
public class ScenicSpotInformationController extends BaseController<ScenicSpotInformation,ScenicSpotInformationService> {

    /**
     *景点信息对象
     */
    @Autowired
    public ScenicSpotInformationController(ScenicSpotInformationService service) {
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
