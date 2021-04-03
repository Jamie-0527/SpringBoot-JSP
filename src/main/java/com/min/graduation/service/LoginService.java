package com.min.graduation.service;

import com.min.graduation.entity.Company;
import com.min.graduation.entity.Login;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;

/**
 * 此类为学生实体类（Login）的Service层接口
 */

public interface LoginService {

    //用户登录
    Login login(String username);

    //初始化密码
    int update(String username, String password);

    //重置账号
    int reset(String username);

    //更改密码
//    int updatePassword(String user_name, String password);

    //获取学生姓名
    Student getStudentName(String s_id);

    //获取教师姓名
    Teacher getTeacherName(String t_id);

    //获取企业人员姓名
    Company getCompanyPersonName(String company_person_id);

}
