package com.lcyy.hanzhong.controller.other;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.HotelInformation;
import com.lcyy.hanzhong.service.other.HotelInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;


/**
 *酒店信息：(HotelInformation)表控制层
 *
 */
@RestController
@RequestMapping("/hotel_information")
public class HotelInformationController extends BaseController<HotelInformation,HotelInformationService> {

    /**
     *酒店信息对象
     */
    @Autowired
    public HotelInformationController(HotelInformationService service) {
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
