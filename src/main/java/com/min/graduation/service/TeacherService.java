package com.min.graduation.service;



import com.min.graduation.entity.Grade;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;

import java.util.List;

/**
 * 此类为Teacher类的Service层接口
 */

public interface TeacherService {

    //查询个人信息
    Teacher personInformation(String t_id);

    //查询班级所有学生信息
    List<Teacher> findClassStudent(String t_id);

    //更新教师信息
    int updateTeacher(Teacher teacher);

    //更新班级学生信息
    int t_updateInfo(Student student);

    //通过teacherID获取授课班级名称
    List<Grade> getGradeName(String t_id);

    //查询授课班级提交的实训报告---格式修正
    List<Report> getGradeReport(String c_name);

    //查询授课班级提交的实训报告---无格式修正
    List<Report> getGradeReportNoFormat(String c_name);

}
