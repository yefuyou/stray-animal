package com.example.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.Result;
import com.example.entity.Role;
import com.example.service.RoleService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/role")
public class RoleController {
    @Resource
     private RoleService roleService;

    @PostMapping
    public Result<?> save(@RequestBody Role role) {
        return Result.success(roleService.save(role));
    }

    @PutMapping
    public Result<?> update(@RequestBody Role role) {
        return Result.success(roleService.updateById(role));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        roleService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Role> findById(@PathVariable Long id) {
        return Result.success(roleService.getById(id));
    }

    @GetMapping
    public Result<List<Role>> findAll() {
        return Result.success(roleService.list());
    }

    @GetMapping("/page")
    public Result<IPage<Role>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(roleService.page(new Page<>(pageNum, pageSize), Wrappers.<Role>lambdaQuery().like(Role::getName, name)));
    }

}
