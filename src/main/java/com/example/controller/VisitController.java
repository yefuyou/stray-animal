package com.example.controller;

import com.example.common.Result;
import com.example.entity.Visit;
import com.example.service.VisitService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/visit")
public class VisitController {
    @Resource
     private VisitService visitService;

    @PostMapping
    public Result<?> save(@RequestBody Visit visit) {
        return Result.success(visitService.save(visit));
    }

    @PutMapping
    public Result<?> update(@RequestBody Visit visit) {
        return Result.success(visitService.updateById(visit));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        visitService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Visit> findById(@PathVariable Long id) {
        return Result.success(visitService.getById(id));
    }

    @GetMapping
    public Result<List<Visit>> findAll() {
        return Result.success(visitService.list());
    }

    @GetMapping("/page")
    public Result<IPage<Visit>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(visitService.page(new Page<>(pageNum, pageSize), Wrappers.<Visit>lambdaQuery().like(Visit::getAname, name)));
    }

}
