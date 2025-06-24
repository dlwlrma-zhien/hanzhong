package com.lcyy.hanzhong.controller.article;

import com.lcyy.hanzhong.controller.base.BaseController;
import com.lcyy.hanzhong.entity.Comment;
import com.lcyy.hanzhong.service.article.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 评论：(Comment)表控制层
 *
 */
@RestController
@RequestMapping("comment")
public class CommentController extends BaseController<Comment, CommentService> {
    /**
     * 服务对象
     */
    @Autowired
    public CommentController(CommentService service) {
        setService(service);
    }

}


