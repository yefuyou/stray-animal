package com.example.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.Permission;
import com.example.entity.Role;
import com.example.entity.User;
import com.example.exception.CustomException;
import com.example.mapper.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class UserService extends ServiceImpl<UserMapper, User> {

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleService roleService;

    public User login(User user) {
        User one = getOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, user.getUsername()).eq(User::getPassword, user.getPassword()));
        if (one == null) {
            throw new CustomException("-1", "账号或密码错误");
        }
        setPermission(one);
        return one;
    }

    public User register(User user) {
        User one = getOne((Wrappers.<User>lambdaQuery().eq(User::getUsername, user.getUsername())));
        if (one != null) {
            throw new CustomException("-1", "用户已注册");
        }
        if (user.getPassword() == null) {
            user.setPassword("123456");
        }
        save(user);
        return getOne((Wrappers.<User>lambdaQuery().eq(User::getUsername, user.getUsername())));
    }

    private User setPermission(User user) {
        List<Role> role = user.getRole();
        if (role != null) {
            List<Permission> permissions = new ArrayList<>();
            for (Object r : role) {
                LinkedHashMap map = (LinkedHashMap) r;
                Role realRole = roleService.getById((int) map.get("id"));
                permissions.addAll(realRole.getPermission());
            }
            user.setPermission(permissions);
        }
        return user;
    }

    public User getbyUsername(String username) {
        User one = getOne((Wrappers.<User>lambdaQuery().eq(User::getUsername, username)));
        setPermission(one);
        return one;
    }
}
