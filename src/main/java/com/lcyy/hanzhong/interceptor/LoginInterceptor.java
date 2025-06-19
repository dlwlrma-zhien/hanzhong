package com.lcyy.hanzhong.interceptor;

import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: dlwlrma
 * @data 2025年06月19日 21:27
 * @Description 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

    //判断用户是否登录
    private String tokenName = "x-auth-token";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(this.tokenName);
        setHeader(request, response);
        if (request.getRequestURL().toString().contains("/api/user/login")){
            //登陆接口放行
            return true;
        }
        else if (request.getRequestURL().toString().contains("/api/user/state")){
            //登陆状态放行
            return true;
        }
        else if (request.getRequestURL().toString().contains("/api/user/register")){
            //注册接口放行
            return true;
        }
        if (token == null || "".equals(token)){
            if ("POST".equals(request.getMethod())){
                return false;
            }else {
                return true;
            }
        }else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }

    private void failure(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //处理未登录请求的失败响应
        response.setHeader("Content-type", "application/json;charset=UTF-8");
        response.setStatus(401);
        //定向到首页
        response.sendRedirect("index.html");
    }

    private void setHeader(HttpServletRequest request, HttpServletResponse response) {
        //跨域的header设置
        response.setHeader("Access-control-Allow-Origin", request.getHeader("Origin"));
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Headers", request.getHeader("Access-Control-Request-Headers"));
        response.setHeader("Access-Control-Max-Age", "1800");
        //防止乱码，适用于传输JSON数据
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        response.setStatus(HttpStatus.OK.value());
    }
}
