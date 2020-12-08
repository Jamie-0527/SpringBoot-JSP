package com.min.graduation.service;


import com.min.graduation.entity.Company;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;

import java.util.List;

/**
 * 此类为Admin类的Service接口
 */

public interface AdminService {

    //查询所有学生信息
    public List<Student> findAllStudent();

    //添加学生信息
    public int addStudent(Student student);

    //添加学生登录信息
    public int addLogin(String userName, Integer authority);

    //更新学生信息
    public int updateStudent(Student student);

    //删除学生信息
    public int deleteStudent(String sid);



    //查询所有教师信息
    public List<Teacher> findAllTeacher();

    //添加教师信息
    public int addTeacher(Teacher teacher);

    //更新教师信息
    public int updateTeacher(Teacher teacher);

    //删除教师信息
    public int deleteTeacher(String tid);



    //查询所有公司信息
    public List<Company> findAllCompany();

    //添加公司信息
    public int addCompany(Company company);

    //更新公司信息
    public int updateCompany(Company company);

    //删除公司信息
    public int deleteCompany(String company_id);

    //根据名字查询公司信息
    Company findCompanyByName(String company_name);

}
