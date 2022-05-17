package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.Result;
import com.example.entity.Adopt;
import com.example.entity.User;
import com.example.service.AdoptService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/adopt")
public class AdoptController {
    @Resource
     private AdoptService adoptService;
     HttpServletRequest request;
    @PostMapping
    public Result<?> save(@RequestBody Adopt adopt) {
        return Result.success(adoptService.save(adopt));
    }

    @PutMapping("/{aid}/{uid}")
    public Result<?> update(@RequestBody Adopt adopt,@PathVariable Long aid,@PathVariable Long uid) {
        QueryWrapper<Adopt> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("aid", aid);
        queryWrapper.eq("uid", uid);
        return Result.success(adoptService.update(adopt,queryWrapper));
    }

    @DeleteMapping("/{aid}/{uid}")
    public Result<?> delete(@PathVariable Long aid,@PathVariable Long uid) {

        QueryWrapper<Adopt> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("aid", aid);
        queryWrapper.eq("uid", uid);
        return Result.success(adoptService.remove(queryWrapper));
    }
    @GetMapping("/{aid}/{uid}")
    public Result<?> findByBoth(@PathVariable Long aid,@PathVariable Long uid) {

        QueryWrapper<Adopt> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("aid", aid);
        queryWrapper.eq("uid", uid);
        return Result.success(adoptService.list(queryWrapper));
    }


    @GetMapping
    public Result<List<Adopt>> findAll() {
        return Result.success(adoptService.list());
    }

    @GetMapping("/page")
    public Result<IPage<Adopt>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(adoptService.page(new Page<>(pageNum, pageSize), Wrappers.<Adopt>lambdaQuery().like(Adopt::getAname, name)));
    }
    @GetMapping("/page1")
    public Result<IPage<Adopt>> findPage1(@RequestParam(required = false, defaultValue = "") String name,
                                         @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                         @RequestParam(required = false, defaultValue = "10") Integer pageSize) {

        return Result.success(adoptService.page(new Page<>(pageNum, pageSize), Wrappers.<Adopt>lambdaQuery().like(Adopt::getUname, name)));
    }
    @GetMapping("/page2")
    public Result<IPage<Adopt>> findPage2(@RequestParam(required = false, defaultValue = "") String name,
                                          @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                          @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                          @RequestParam Long uid) {

        return Result.success(adoptService.page(new Page<>(pageNum, pageSize), Wrappers.<Adopt>lambdaQuery().like(Adopt::getAid, name).eq(Adopt::getUid,uid)));
    }

}
