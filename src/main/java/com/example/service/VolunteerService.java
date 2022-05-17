package com.example.service;

import com.example.entity.Volunteer;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.VolunteerMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class VolunteerService extends ServiceImpl<VolunteerMapper, Volunteer> {

    @Resource
    private VolunteerMapper volunteerMapper;

}
