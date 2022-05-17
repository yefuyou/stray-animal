package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

@TableName("t_visit")
public class Visit extends Model<Visit> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 动物ID
      */
    private Long petId;
    private Long uid;

    /**
      * 回访时间
      */
    @JsonFormat(pattern ="yyyy-MM-dd",timezone ="GMT+8")
    private Date vtime;

    /**
      * 健康状态
      */
    private Integer state;

    /**
      * 回访图片
      */
    private String pic;

    /**
      * 回访评价
      */
    private String remark;

    /**
      * 回访标题
      */
    private String vname;
    private String aname;

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
         this.id = id;
    }

    public Long getPetId() {
        return petId;
    }

    public void setPetId(Long petId) {
         this.petId = petId;
    }

    public Date getVtime() {
        return vtime;
    }

    public void setVtime(Date vtime) {
         this.vtime = vtime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
         this.state = state;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
         this.pic = pic;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
         this.remark = remark;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
         this.vname = vname;
    }

}
