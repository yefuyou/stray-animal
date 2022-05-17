package com.example.service;

import com.example.entity.Notice;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class NoticeService extends ServiceImpl<NoticeMapper, Notice> {

    @Resource
    private NoticeMapper noticeMapper;

}
