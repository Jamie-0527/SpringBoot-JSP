package com.min.graduation.dao;

import com.min.graduation.entity.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 此类为管理员类的Dao接口
 */

@Mapper
public interface AdminDao {

    //查询所有学生信息
    List<Student> findAllStudent();

    //添加学生信息
    int addStudent(Student student);

    //添加学生登录信息
    int addLogin(Map<String,Object> map);

    //更新学生信息
    int updateStudent(Student student);

    //删除学生信息
    int deleteStudent(@Param("sid") String sid);


    //查询班级信息
    List<Grade> findGrade(String c_name);


    //查询所有教师信息
    List<Teacher> findAllTeacher();

    //添加教师信息
    int addTeacher(Teacher teacher);

    //添加教师班级-->
    int addTeacherGrade(Grade grade);

    //更新教师信息
    int updateTeacher(Teacher teacher);

    //删除教师信息
    int deleteTeacher(@Param("tid") String tid);



    //查询所有公司信息
    List<Company> findAllCompany();

    //添加公司信息
    int addCompany(Company company);

    //更新公司信息
    int updateCompany(Company company);

    //删除公司信息
    int deleteCompany(String company_person_id);

    //根据名字查询公司信息
    Company findCompanyByName(String company_name);


    //查询学生账户信息
    List<Admin> findStudentAccount();

    //查询教师账户信息
    List<Admin> findTeacherAccount();

    //查询企业员工账户信息
    List<Admin> findCompanyAccount();

    //根据用户名查询账户信息
    Login findAccountByUserName(String user_name);

    //禁用账户
    int disableAccount(String user_name);

    //启用账户
    int enableAccount(String user_name);

    //查询所有实训报告
    List<Report> findAllReport();

}
