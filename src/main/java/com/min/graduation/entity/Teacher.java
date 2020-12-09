package com.min.graduation.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 此类为教师封装类
 */
@Data
public class Teacher implements Serializable {

    private String t_id;         //教师工号
    private String t_name;       //姓名
    private String t_rank;       //职称
    private String t_college;    //所属学院
    private String t_phone;      //联系方式

//    private Grade grade;
//    private Student student;


    public Teacher() {}

    public Teacher(String t_id, String t_name, String t_rank, String t_college, String t_phone) {
        this.t_id = t_id;
        this.t_name = t_name;
        this.t_rank = t_rank;
        this.t_college = t_college;
        this.t_phone = t_phone;
    }
}
