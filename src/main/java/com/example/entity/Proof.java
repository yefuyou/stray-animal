package com.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@TableName("t_proof")
public class Proof extends Model<Proof> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 领养ID
      */
    private Long paid;
    private Long puid;
    private String aname;
    private String uname;
    /**
      * 凭证图片
      */
    private String ppic;

    /**
      * 凭证名称
      */
    private String ptitle;

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
         this.id = id;
    }

    public Long getPaid() {
        return paid;
    }

    public void setPaid(Long paid) {
         this.paid = paid;
    }

    public Long getPuid() {
        return puid;
    }

    public void setPuid(Long puid) {
        this.puid = puid;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
         this.ppic = ppic;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
         this.ptitle = ptitle;
    }

}
