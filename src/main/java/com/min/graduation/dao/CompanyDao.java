package com.min.graduation.dao;

import com.min.graduation.entity.Company;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zhangjiamin
 * @date 2020/12/11 17:51
 */
@Mapper
public interface CompanyDao {

    //查询个人信息
    Company personInformation(String company_person_id);

    //查询公司实训学生信息
    List<Student> findCompanyStudent(String company_person_id);

    //更新实训学生的信息
    int c_updateInfo(Student student);

    //查询实训学生提交的实训报告
    List<Report> getCompanyReport(String company_person_id);
}
