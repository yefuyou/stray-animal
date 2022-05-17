package com.example.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthInterceptor())
              //  .addPathPatterns("/api/**")
                .addPathPatterns("/page/**")
                .excludePathPatterns("/page/end/login.html", "/page/end/register.html","/page/front/login.html");
               // .excludePathPatterns("/api/user/login", "/api/user/register");
    }
}
