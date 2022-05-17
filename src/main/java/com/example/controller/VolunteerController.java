package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.entity.Volunteer;
import com.example.service.VolunteerService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/volunteer")
public class VolunteerController {
    @Resource
    private VolunteerService volunteerService;

    @PostMapping
    public Result<?> save(@RequestBody Volunteer volunteer) {
        return Result.success(volunteerService.save(volunteer));
    }

    @PutMapping
    public Result<?> update(@RequestBody Volunteer volunteer) {
        return Result.success(volunteerService.updateById(volunteer));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        volunteerService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Volunteer> findById(@PathVariable Long id) {
        return Result.success(volunteerService.getById(id));
    }

    @GetMapping
    public Result<List<Volunteer>> findAll() {
        return Result.success(volunteerService.list());
    }

    @GetMapping("/page")
    public Result<IPage<Volunteer>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                                @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(volunteerService.page(new Page<>(pageNum, pageSize), Wrappers.<Volunteer>lambdaQuery().like(Volunteer::getLocation, name)));
    }
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {

        List<Map<String, Object>> list = CollUtil.newArrayList();

        List<Volunteer> all = volunteerService.list();
        for (Volunteer volunteer : all) {
            Map<String, Object> row1 = new LinkedHashMap<>();
            row1.put("名称", volunteer.getName());
            row1.put("年龄", volunteer.getAge());
            row1.put("工作单位", volunteer.getCompany());
            row1.put("邮箱", volunteer.getEmail());
            row1.put("微信号", volunteer.getWechat());
            row1.put("联系电话", volunteer.getTel());
            row1.put("现居地", volunteer.getLocation());
            row1.put("是否到过基地（1为到过，0为未到过）", volunteer.getIsvisit());
            row1.put("每周空闲时间", volunteer.getSparetime());
            row1.put("能力自述", volunteer.getMoreability());
            list.add(row1);
        }

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("义工申请", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        writer.close();
        IoUtil.close(System.out);
    }


}
