package com.lcyy.hanzhong.controller;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Article;
import com.lcyy.hanzhong.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: dlwlrma
 * @data 2025年06月21日 15:27
 * @Description 文章控制器
 */
@RestController
@RequestMapping("article")
public class ArticleController extends BaseController<Article, ArticleService> {

    @Autowired
    public ArticleController(ArticleService service){
        setService(service);
    }
}
