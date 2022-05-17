package com.example.service;

import com.example.entity.Proof;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.ProofMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ProofService extends ServiceImpl<ProofMapper, Proof> {

    @Resource
    private ProofMapper proofMapper;

}