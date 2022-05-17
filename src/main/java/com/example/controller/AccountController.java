package com.example.controller;

import com.example.common.Result;
import com.example.entity.Account;
import com.example.service.AccountService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/account")
public class AccountController {
    @Resource
    private AccountService accountService;

    @PostMapping
    public Result<?> save(@RequestBody Account account) {
        return Result.success(accountService.save(account));
    }

    @PutMapping
    public Result<?> update(@RequestBody Account account) {
        return Result.success(accountService.updateById(account));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        accountService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Account> findById(@PathVariable Long id) {
        return Result.success(accountService.getById(id));
    }

    @GetMapping
    public Result<List<Account>> findAll() {
        return Result.success(accountService.list());
    }

    @GetMapping("/page")
    public Result<IPage<Account>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(accountService.page(new Page<>(pageNum, pageSize), Wrappers.<Account>lambdaQuery().like(Account::getAuname, name)));
    }

}
