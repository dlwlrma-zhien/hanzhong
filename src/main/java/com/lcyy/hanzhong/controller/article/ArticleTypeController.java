package com.lcyy.hanzhong.controller.article;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.ArticleType;
import com.lcyy.hanzhong.service.article.ArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: dlwlrma
 * @data 2025年06月21日 15:59
 * @Description 文章类型控制器
 */
@RestController
@RequestMapping("article_type")
public class ArticleTypeController extends BaseController<ArticleType, ArticleTypeService> {

    @Autowired
    public ArticleTypeController(ArticleTypeService service){
        setService(service);
    }
}
