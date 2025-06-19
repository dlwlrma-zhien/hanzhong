package com.lcyy.hanzhong.config;

import com.lcyy.hanzhong.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author: dlwlrma
 * @data 2025年06月19日 21:21
 * @Description Web的配置类，注册登录拦截器
 */
@Configuration
public class WebAppConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //登录拦截的管理器
        InterceptorRegistration registration = registry.addInterceptor(loginInterceptor());
        //拦截的地址
        registration.addPathPatterns("/**");
        //方行的地址
//        registration.excludePathPatterns("/**");
        //根据需要拦截，一般设置所有地址拦截，放行公共连接
    }

    private HandlerInterceptor loginInterceptor() {
        return new LoginInterceptor();
    }
}
