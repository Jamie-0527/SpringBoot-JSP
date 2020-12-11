package com.min.graduation.service;



import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;

import java.util.List;

/**
 * 此类为Teacher类的Service层接口
 */

public interface TeacherService {

    //查询个人信息
    Teacher personInformation(String tid);

    //查询班级所有学生信息
    List<Student> findClassStudent(String name);

    //更新教师信息
    int updateTeacher(Teacher teacher);

}
