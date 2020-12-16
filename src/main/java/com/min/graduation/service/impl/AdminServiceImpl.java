package com.min.graduation.service.impl;

import com.min.graduation.dao.AdminDao;
import com.min.graduation.entity.*;
import com.min.graduation.service.AdminService;

import com.min.graduation.utils.ChangeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;
    @Autowired
    private ChangeFormat changeFormat;

    @Override
    public List<Student> findAllStudent() {
        return adminDao.findAllStudent();
    }

    @Override
    public int addStudent(Student student) {
        return adminDao.addStudent(student);
    }

    @Override
    public int addLogin(String userName, Integer authority) {
        Map<String,Object> map = new HashMap<>();
        map.put("userName",userName);
        map.put("authority",authority);
        return adminDao.addLogin(map);
    }

    @Override
    public int updateStudent(Student student) {
        return adminDao.updateStudent(student);
    }

    @Override
    public int deleteStudent(String sid) {
        return adminDao.deleteStudent(sid);
    }

    @Override
    public List<Teacher> findAllTeacher() {
        return adminDao.findAllTeacher();
    }

    @Override
    public int addTeacher(Teacher teacher) {
        return adminDao.addTeacher(teacher);
    }

    @Override
    public int updateTeacher(Teacher teacher) {
        return adminDao.updateTeacher(teacher);
    }

    @Override
    public int deleteTeacher(String tid) {
        return adminDao.deleteTeacher(tid);
    }

    @Override
    public List<Company> findAllCompany() {
        return adminDao.findAllCompany();
    }

    @Override
    public int addCompany(Company company) {
        return adminDao.addCompany(company);
    }

    @Override
    public int updateCompany(Company company) {
        return adminDao.updateCompany(company);
    }

    @Override
    public int deleteCompany(String company_person_id) {
        return adminDao.deleteTeacher(company_person_id);
    }

    @Override
    public Company findCompanyByName(String company_name) {
        return adminDao.findCompanyByName(company_name);
    }

    @Override
    public List<Admin> findStudentAccount() {
        return adminDao.findStudentAccount();
    }

    @Override
    public List<Admin> findTeacherAccount() {
        return adminDao.findTeacherAccount();
    }

    @Override
    public List<Admin> findCompanyAccount() {
        return adminDao.findCompanyAccount();
    }

    @Override
    public Login findAccountByUserName(String user_name) {
        return adminDao.findAccountByUserName(user_name);
    }

    @Override
    public int disableAccount(String user_name) {
        return adminDao.disableAccount(user_name);
    }

    @Override
    public int enableAccount(String user_name) {
        return adminDao.enableAccount(user_name);
    }

    @Override
    public List<Report> findAllReport() {
        List<Report> reports = adminDao.findAllReport();
        for (Report report : reports){
            report.setCommit_time(changeFormat.setFormat(report.getCommit_time()));
        }
        return reports;
    }


}
