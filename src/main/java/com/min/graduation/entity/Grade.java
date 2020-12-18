package com.min.graduation.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 此类为班级封装类
 */

@Data
public class Grade implements Serializable {

    private String c_id;     //班级编号
    private String c_name;   //班级名称
    private String t_id;     //教师编号

    public Grade() {
    }
    public Grade(String c_id, String c_name, String t_id) {
        this.c_id = c_id;
        this.c_name = c_name;
        this.t_id = t_id;
    }
}
