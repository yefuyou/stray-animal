package com.example.controller;

import com.example.common.Result;
import com.example.entity.Proof;
import com.example.service.ProofService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/proof")
public class ProofController {
    @Resource
     private ProofService proofService;

    @PostMapping
    public Result<?> save(@RequestBody Proof proof) {
        return Result.success(proofService.save(proof));
    }

    @PutMapping
    public Result<?> update(@RequestBody Proof proof) {
        return Result.success(proofService.updateById(proof));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        proofService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Proof> findById(@PathVariable Long id) {
        return Result.success(proofService.getById(id));
    }

    @GetMapping
    public Result<List<Proof>> findAll() {
        return Result.success(proofService.list());
    }

    @GetMapping("/page")
    public Result<IPage<Proof>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(proofService.page(new Page<>(pageNum, pageSize), Wrappers.<Proof>lambdaQuery().like(Proof::getUname, name)));
    }
    @GetMapping("/page1")
    public Result<IPage<Proof>> findPage1(@RequestParam(required = false, defaultValue = "") String name,
                                         @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                         @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                          @RequestParam Long uid) {
        return Result.success(proofService.page(new Page<>(pageNum, pageSize), Wrappers.<Proof>lambdaQuery().eq(Proof::getPuid,uid)));
    }

}
