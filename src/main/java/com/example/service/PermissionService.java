package com.example.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.Permission;
import com.example.entity.Role;
import com.example.mapper.PermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class PermissionService extends ServiceImpl<PermissionMapper, Permission> {

    @Resource
    private PermissionMapper permissionMapper;

    @Resource
    private RoleService roleService;

    public List<Permission> getByRoles(List<Role> roles) {
        List<Permission> permissions = new ArrayList<>();
        for (Role role : roles) {
            Role r = roleService.getById(role.getId());
            permissions.addAll(r.getPermission());
        }
        return permissions;
    }

    public void delete(Long id) {
        Permission delPermission = getById(id);
        removeById(id);
        // 删除角色分配的菜单
        List<Role> list = roleService.list();
        for (Role role : list) {
            List<Permission> permission = role.getPermission();
            // 重新分配权限
            List<Permission> newP = new ArrayList<>();
            for (Object p : permission) {
                LinkedHashMap map = (LinkedHashMap) p;
                Object flag = map.get("flag");
                if(!delPermission.getFlag().equals(flag)) {
                    Permission p1 = new Permission();
                    BeanUtil.copyProperties(map, p1);
                    newP.add(p1);
                }
            }
            role.setPermission(newP);
            roleService.updateById(role);
        }
    }
}
