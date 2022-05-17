package com.example.common;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 拦截器
 */
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        Object user = request.getSession().getAttribute("user");
        if (user != null) {
            request.getSession().setAttribute("user", user);
            return true;
        }
        response.sendRedirect("/page/end/login.html");
        return false;
    }

}
