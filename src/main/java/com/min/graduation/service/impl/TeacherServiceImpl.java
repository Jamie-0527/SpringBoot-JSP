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

}
