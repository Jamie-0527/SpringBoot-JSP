package com.min.graduation.service.impl;

import com.min.graduation.dao.CompanyDao;
import com.min.graduation.entity.Company;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import com.min.graduation.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangjiamin
 * @date 2020/12/11 17:57
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDao companyDao;

    @Override
    public Company personInformation(String company_person_id) {
        return companyDao.personInformation(company_person_id);
    }

    @Override
    public List<Student> findCompanyStudent(String company_person_id) {
        return companyDao.findCompanyStudent(company_person_id);
    }

    @Override
    public int c_updateInfo(Student student) {
        return companyDao.c_updateInfo(student);
    }

    @Override
    public List<Report> getCompanyReport(String company_person_id) {
        return companyDao.getCompanyReport(company_person_id);
    }
}
