package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

@TableName("t_animal")
public class Animal extends Model<Animal> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 动物名字
      */
    private String tname;

    /**
      * 动物品种
      */
    private String ttype;

    /**
      * 动物性别
      */
    private String tsex;

    /**
      * 动物生日
      */
    @JsonFormat(pattern ="yyyy-MM-dd",timezone ="GMT+8")
    private Date tbirthday;

    /**
      * 动物图片
      */
    private String tpic;

    /**
      * 动物状态
      */
    private Integer tstate;

    /**
      * 动物描述
      */
    private String tdescribe;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
         this.id = id;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
         this.tname = tname;
    }

    public String getTtype() {
        return ttype;
    }

    public void setTtype(String ttype) {
         this.ttype = ttype;
    }

    public String getTsex() {
        return tsex;
    }

    public void setTsex(String tsex) {
         this.tsex = tsex;
    }

    public Date getTbirthday() {
        return tbirthday;
    }

    public void setTbirthday(Date tbirthday) {
         this.tbirthday = tbirthday;
    }

    public String getTpic() {
        return tpic;
    }

    public void setTpic(String tpic) {
         this.tpic = tpic;
    }

    public Integer getTstate() {
        return tstate;
    }

    public void setTstate(Integer tstate) {
         this.tstate = tstate;
    }

    public String getTdescribe() {
        return tdescribe;
    }

    public void setTdescribe(String tdescribe) {
         this.tdescribe = tdescribe;
    }

}
