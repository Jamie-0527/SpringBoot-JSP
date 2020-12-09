package com.min.graduation.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 此类为用户登录和注册封装类
 */
@Data
public class Login implements Serializable {

    private String userName;        //用户名
    private String password;        //密码
    private Integer authority;      //权限
    private Date createTime;        //用户创建时间
    private Date modifyTime;        //修改时间
    private Integer status;         //账号状态

//    /*注入学生对象*/
//    private Student student;

}
