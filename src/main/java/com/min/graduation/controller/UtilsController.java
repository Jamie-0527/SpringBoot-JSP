package com.min.graduation.controller;

import com.min.graduation.entity.Company;
import com.min.graduation.entity.Grade;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.AdminService;
import com.min.graduation.service.LoginService;
import com.min.graduation.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UtilsController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private StudentService studentService;


    @RequestMapping("")
    public String login2(){return "login";}

    //初始化学生个人信息
    @RequestMapping("initStudent")
    public String initStudent(Model model, HttpServletRequest request){
        //获取前端传来的数据
        String s_id = request.getParameter("s_id");
        String pwd = request.getParameter("s_pwd");
        String s_name = request.getParameter("s_name");
        String c_name = request.getParameter("c_name");
        String s_phone = request.getParameter("s_phone");
        String s_college = request.getParameter("s_college");
        String company_name = request.getParameter("company_name");

        /*匹配班级ID*/
        Grade gradeInfo = studentService.findGradeInfo(c_name);
        loginService.update(s_id,pwd);
        if (company_name.length()==0){
            Student student = new Student(s_id,s_name,gradeInfo.getC_id(),s_phone,s_college);
            adminService.addStudent(student);

        }else {
            Student student = new Student(s_id,s_name,gradeInfo.getC_id(),s_phone,s_college,company_name);
            adminService.addStudent(student);
        }

        model.addAttribute("ok_init","初始化成功！欢迎使用本系统。");
        return "student/home";
    }

    //初始化教师个人信息
    @RequestMapping("initTeacher")
    public String initTeacher(Model model, HttpServletRequest request){
        //获取前端传来的数据
        String t_id = request.getParameter("t_id");
        String t_pwd = request.getParameter("t_pwd");
        String t_name = request.getParameter("t_name");
        String t_rank = request.getParameter("t_rank");
        String t_phone = request.getParameter("t_phone");
        String t_college = request.getParameter("t_college");


        loginService.update(t_id,t_pwd);
        Teacher teacher = new Teacher(t_id,t_name,t_rank,t_college,t_phone);
        adminService.addTeacher(teacher);

        model.addAttribute("ok_init","初始化成功！欢迎使用本系统。");
        return "teacher/home";
    }

    //初始化公司个人信息
    @RequestMapping("initCompany")
    public String initCompany(Model model, HttpServletRequest request){
        //获取前端传来的数据
        String company_person_id = request.getParameter("company_person_id");
        String c_pwd = request.getParameter("c_pwd");
        String company_id = request.getParameter("company_id");
        String company_name = request.getParameter("company_name");
        String company_address = request.getParameter("company_address");
        String company_person = request.getParameter("company_person");
        String company_phone = request.getParameter("company_phone");

        loginService.update(company_person_id,c_pwd);
        Company company = new Company(company_id,company_name,company_address,company_person_id,company_person,company_phone);
        adminService.addCompany(company);

        model.addAttribute("ok_init","初始化成功！欢迎使用本系统。");
        return "company/home";
    }

}
