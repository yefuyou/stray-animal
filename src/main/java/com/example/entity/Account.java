package com.example.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;


@Data
@TableName("t_account")
public class Account extends Model<Account> {
    /**
      * 主键
      */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
      * 款项名称 
      */
    private String alabel;

    /**
      * 经手人名字 
      */
    private String auname;

    /**
      * 款项金额 
      */
    private Double avalue;

    /**
      * 款项用途详情 
      */
    private String adescribe;

}