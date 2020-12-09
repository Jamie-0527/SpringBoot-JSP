package com.min.graduation.controller;

import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 此类为Teacher对象的控制层
 */
@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("teacherUpdate")
    public String teacherUpdate(){
        return "teacher/update";
    }

    //查询个人信息
    @RequestMapping("teacherPersonInformation")
    public String teacherPersonInformation(Model model, String tid) {

        Teacher teacher = teacherService.personInformation(tid);
        model.addAttribute("teacher",teacher);

        return "teacher/information";
    }

    //查询班级学生信息
    @RequestMapping("teacherGradeInformation")
    public String teacherGradeInformation(Model model, String tname) {

        List<Student> classStudent = teacherService.findClassStudent(tname);
        model.addAttribute("classStudent",classStudent);

        return "teacher/gradeInformation";
    }

    //更新教师信息
    @RequestMapping("teacherUpdateInformation")
    public String teacherUpdateInformation(Model model, Teacher teacher) {

        teacherService.updateTeacher(teacher);
        Teacher t = teacherService.personInformation(teacher.getT_id());
        model.addAttribute("teacher",t);

        return "teacher/loginSuccess";
    }

}
