package com.min.graduation.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 此类为管理员封装类
 */
@Data
public class Admin implements Serializable {

    private Student student;
    private Teacher teacher;
    private Company company;
    private Grade grade;
}
