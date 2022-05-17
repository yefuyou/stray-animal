package com.example.service;

import com.example.entity.Animal;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.AnimalMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AnimalService extends ServiceImpl<AnimalMapper, Animal> {

    @Resource
    private AnimalMapper animalMapper;

}