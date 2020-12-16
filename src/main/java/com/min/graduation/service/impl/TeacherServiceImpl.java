package com.min.graduation.service.impl;

import com.min.graduation.dao.TeacherDao;
import com.min.graduation.entity.Grade;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.TeacherService;
import com.min.graduation.utils.ChangeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 此类为Teacher类的Service层接口实现类
 */

@Service
public class TeacherServiceImpl implements TeacherService {

    /*注入TeacherDao对象*/
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private ChangeFormat changeFormat;

    @Override
    public Teacher personInformation(String t_id) {
        return teacherDao.personInformation(t_id);
    }

    @Override
    public List<Teacher> findClassStudent(String t_id) {
        return teacherDao.findClassStudent(t_id);
    }

    @Override
    public int updateTeacher(Teacher teacher) {
        return teacherDao.updateTeacher(teacher);
    }

    @Override
    public int t_updateInfo(Student student) {
        return teacherDao.t_updateInfo(student);
    }

    @Override
    public List<Grade> getGradeName(String t_id) {
        return teacherDao.getGradeName(t_id);
    }

    @Override
    public List<Report> getGradeReport(String c_name) {
        List<Report> reports = teacherDao.getGradeReport(c_name);
        for (Report report : reports){
            report.setCommit_time(changeFormat.setFormat(report.getCommit_time()));
        }
        return reports;
    }

    @Override
    public List<Report> getGradeReportNoFormat(String c_name) {
        return teacherDao.getGradeReport(c_name);
    }

}
