package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.github.jeffreyning.mybatisplus.anno.MppMultiId;

@TableName("t_adopt")
public class Adopt extends Model<Adopt> {
    @MppMultiId
    @TableField(value = "aid")
    private Long aid;

    @MppMultiId
    @TableField(value = "uid")
    private Long uid;

    /**
//     * 申请人性别
//     */
//    private String uname;
    /**
      * 申请人性别
      */
    private String gender;

    /**
      * 申请人年龄
      */
    private Integer age;

    /**
      * 婚姻状况
      */
    private Integer maritalstatus;

    /**
      * 家庭住址
      */
    private String occupation;

    /**
      * 联系方式
      */
    private Long tel;

    /**
      * 家庭住址
      */
    private String location;

    /**
      * 固定住所
      */
    private Integer fixresident;

    /**
      * 收入
      */

    private Integer income;

    /**
      * 养宠经验
      */
    private Integer experience;

    /**
      * 现有宠物数量
      */
    private Integer petnum;

    /**
      * 家人同意
      */
    private Integer familyagree;

    /**
      * 微信号
      */
    private String wechat;

    /**
      * 申请状态
      */
    private Integer vstate;

    private String uname;
    private String apic;
    private String aname;

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getApic() {
        return apic;
    }

    public void setApic(String apic) {
        this.apic = apic;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
         this.aid = aid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
         this.uid = uid;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
         this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
         this.age = age;
    }

    public Integer getMaritalstatus() {
        return maritalstatus;
    }

    public void setMaritalstatus(Integer maritalstatus) {
         this.maritalstatus = maritalstatus;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
         this.occupation = occupation;
    }

    public Long getTel() {
        return tel;
    }

    public void setTel(Long tel) {
         this.tel = tel;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
         this.location = location;
    }

    public Integer getFixresident() {
        return fixresident;
    }

    public void setFixresident(Integer fixresident) {
         this.fixresident = fixresident;
    }

    public Integer getIncome() {
        return income;
    }

    public void setIncome(Integer income) {
         this.income = income;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
         this.experience = experience;
    }

    public Integer getPetnum() {
        return petnum;
    }

    public void setPetnum(Integer petnum) {
         this.petnum = petnum;
    }

    public Integer getFamilyagree() {
        return familyagree;
    }

    public void setFamilyagree(Integer familyagree) {
         this.familyagree = familyagree;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
         this.wechat = wechat;
    }

    public Integer getVstate() {
        return vstate;
    }

    public void setVstate(Integer vstate) {
         this.vstate = vstate;
    }

}
