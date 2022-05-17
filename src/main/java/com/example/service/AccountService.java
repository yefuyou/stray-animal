package com.example.service;

import com.example.entity.Account;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.mapper.AccountMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AccountService extends ServiceImpl<AccountMapper, Account> {

    @Resource
    private AccountMapper accountMapper;

}
