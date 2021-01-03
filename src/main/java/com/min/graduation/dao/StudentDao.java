package com.min.graduation.dao;

import com.min.graduation.entity.Grade;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;

/**
 * 此类为学生实体类（Student）的Dao层接口
 */

@Mapper
public interface StudentDao {

    //查询所有用户
    List<Student> findAll();

    //根据名字模糊查询信息
    List<Student> findByName(@Param("name") String name);

    //根据ID查询信息
    Student findById(@Param("sid") String sid);

    //添加用户
    int addStudent(Student student);

    //更新用户信息
    int updateStudent(Student student);

    //根据ID删除用户
    int deleteStudent(@Param("sid") String sid);

    //查询个人信息
    Student personInformation(@Param("sid") String sid);

    //查询班级信息
    List<Student> findGradeStudent(@Param("gradeName") String gradeName);

    //查询实习公司信息
    Student findCompany(@Param("name") String name);

    //根据班级名字查询班级信息
    List<Grade> findGradeInfo(@Param("className") String className);

    //查询我提交的实训报告
    List<Report> myReport(String s_id);

}
