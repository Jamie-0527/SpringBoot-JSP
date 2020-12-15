package com.min.graduation.service;


import com.min.graduation.entity.Grade;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 此类为Student实体类Service层接口
 */

public interface StudentService {

    //查询所有学生用户
    List<Student> findAll();

    //根据名字查询学生信息
    List<Student> findByName(String name);

    //根据ID查询信息
    Student findById(String sid);

    //添加用户
    int addStudent(Student student);

    //修改用户信息
    int updateStudent(Student student);

    //根据ID删除用户
    int deleteStudent(String sid);

    //查询个人信息
    Student personInformation(String sid);

    //查询班级信息
    List<Student> findGradeStudent(String gradeName);

    //查询实习公司信息
    Student findCompany(String name);

    //根据班级名字查询班级信息
    Grade findGradeInfo(String className);

    //查询我提交的实训报告
    List<Report> myReport(String s_id);

}
