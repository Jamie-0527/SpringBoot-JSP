package com.min.graduation.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 该类为学生实体类
 */
@Data
public class Student implements Serializable {

    private String s_id;              //学号（用户名）
    private String s_name;            //姓名
    private String s_class_no;        //班级编号
    private String s_phone;           //联系方式
    private String s_college;         //所属院系
    private String company_name;       //公司名字

    public Student() {}

    public Student(String s_id, String s_name, String s_class_no, String s_phone, String s_college, String company_name) {
        this.s_id = s_id;
        this.s_name = s_name;
        this.s_class_no = s_class_no;
        this.s_phone = s_phone;
        this.s_college = s_college;
        this.company_name = company_name;
    }
    public Student(String s_id, String s_name, String s_class_no, String s_phone, String s_college) {
        this.s_id = s_id;
        this.s_name = s_name;
        this.s_class_no = s_class_no;
        this.s_phone = s_phone;
        this.s_college = s_college;
    }
    /*引入Grade对象*/
    private Grade grade;
}
