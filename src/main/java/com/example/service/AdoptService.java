package com.example.service;

import com.example.entity.Adopt;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.AdoptMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdoptService extends ServiceImpl<AdoptMapper, Adopt> {

    @Resource
    private AdoptMapper adoptMapper;

}