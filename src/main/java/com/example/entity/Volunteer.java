package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;

import java.util.List;


@Data
@TableName("t_volunteer")
public class Volunteer extends Model<Volunteer> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 能力
      */
    @TableField(typeHandler = JacksonTypeHandler.class)

    /**
      * 本人照片
      */
//    private String apic;

    /**
      * 工作单位
      */
    private String company;

    /**
      * 电子邮件
      */
    private String email;

    /**
      * 性别
      */
    private Integer age;

    /**
      * 是否到过基地
      */
    private Integer isvisit;

    /**
      * 现住址
      */
    private String location;

    /**
      * 更多技能
      */
    private String moreability;

    /**
      * 姓名
      */
    private String name;

    /**
      * 空闲时间
      */
    private Integer sparetime;

    /**
      * 手机
      */
    private String tel;

    private Integer vstate;

    /**
      * 微信号
      */
    private String wechat;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

//    public String getApic() {
//        return apic;
//    }
//
//    public void setApic(String apic) {
//        this.apic = apic;
//    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getIsvisit() {
        return isvisit;
    }

    public void setIsvisit(Integer isvisit) {
        this.isvisit = isvisit;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getMoreability() {
        return moreability;
    }

    public void setMoreability(String moreability) {
        this.moreability = moreability;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getVstate() {
        return vstate;
    }

    public void setVstate(Integer vstate) {
        this.vstate = vstate;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public Integer getSparetime() {
        return sparetime;
    }

    public void setSparetime(Integer sparetime) {
        this.sparetime = sparetime;
    }
}
