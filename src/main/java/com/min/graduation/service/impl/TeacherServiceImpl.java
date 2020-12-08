package com.min.graduation.service.impl;

import com.min.graduation.dao.TeacherDao;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.TeacherService;
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

    @Override
    public Teacher personInformation(String tid) {
        return teacherDao.personInformation(tid);
    }

    @Override
    public List<Student> findClassStudent(String name) {
        return teacherDao.findClassStudent(name);
    }

    @Override
    public int updateTeacher(Teacher teacher) {
        return teacherDao.updateTeacher(teacher);
    }

}
