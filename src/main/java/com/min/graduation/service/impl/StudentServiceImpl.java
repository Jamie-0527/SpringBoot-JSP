package com.min.graduation.service.impl;

import com.min.graduation.dao.StudentDao;
import com.min.graduation.entity.Grade;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import com.min.graduation.service.StudentService;
import com.min.graduation.utils.ChangeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

/**
 * 此类为StudentService接口的实现类
 */

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;
    @Autowired
    private ChangeFormat changeFormat;

    public List<Student> findAll() {
        return studentDao.findAll();
    }

    public List<Student> findByName(String name) {
        return studentDao.findByName(name);
    }

    @Override
    public Student findById(String sid) {
        return studentDao.findById(sid);
    }

    public int addStudent(Student student) {
        return studentDao.addStudent(student);
    }

    @Override
    public int updateStudent(Student student) {
        return studentDao.updateStudent(student);
    }

    @Override
    public int deleteStudent(String sid) {
        return studentDao.deleteStudent(sid);
    }

    @Override
    public Student personInformation(String sid) {
        return studentDao.personInformation(sid);
    }

    @Override
    public List<Student> findGradeStudent(String gradeName) {
        return studentDao.findGradeStudent(gradeName);
    }

    @Override
    public Student findCompany(String name) {
        return studentDao.findCompany(name);
    }

    @Override
    public List<Grade> findGradeInfo(String className) {
        return studentDao.findGradeInfo(className);
    }

    @Override
    public List<Report> myReport(String s_id) {
        List<Report> reports = studentDao.myReport(s_id);
        for (Report report : reports){
            report.setCommit_time(changeFormat.setFormat(report.getCommit_time()));
        }
        return reports;
    }

}
