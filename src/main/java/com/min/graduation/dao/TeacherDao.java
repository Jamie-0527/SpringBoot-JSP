package com.min.graduation.dao;

import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;

/**
 *此类为教师类的Dao曾接口
 */

@Repository
public interface TeacherDao {

    //查询个人信息
    Teacher personInformation(@Param("tid") String tid);

    //查询班级所有学生信息
    List<Student> findClassStudent(@Param("name") String name);

    //更新教师信息
    int updateTeacher(Teacher teacher);


}
