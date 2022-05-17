package com.example.service;

import com.example.entity.Visit;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.VisitMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class VisitService extends ServiceImpl<VisitMapper, Visit> {

    @Resource
    private VisitMapper visitMapper;

}