package com.min.graduation.controller;


import com.min.graduation.entity.Admin;
import com.min.graduation.entity.Company;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.AdminService;
import com.min.graduation.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminColntroller {

    @Autowired
    private AdminService adminService;

    @Autowired
    private LoginService loginService;


    //查询学生信息
    @RequestMapping("studentManagement")
    public String studentManagement(Model model) {

        List<Student> allStudent = adminService.findAllStudent();
        model.addAttribute("allStudent",allStudent);

        return "admin/studentManagement";
    }

    //更新学生信息
    @RequestMapping("updateStudentsInformation")
    public String updateStudentsInformation(Model model, Student student) {

        adminService.updateStudent(student);
        List<Student> allStudent = adminService.findAllStudent();
        model.addAttribute("allStudent",allStudent);

        return "admin/studentManagement";
    }

    //添加学生信息
    @RequestMapping("addStudentsInformation")
    public String addStudentsInformation(Model model,Student student) {

        try{
            adminService.addLogin(student.getS_id(), 1);
            model.addAttribute("ok_addS","添加成功！");
        }catch (Exception exception){
            model.addAttribute("addStudentError","该用户已存在！");
        }finally {
            List<Student> allStudent = adminService.findAllStudent();
            model.addAttribute("allStudent",allStudent);
            return "admin/studentManagement";
        }
    }

    //删除学生信息
    @RequestMapping("deleteStudentsInformation")
    public String deleteStudentsInformation(Model model, HttpServletRequest request) {

        String s_id = request.getParameter("s_id");
        adminService.deleteStudent(s_id);
        loginService.reset(s_id);
        List<Student> allStudent = adminService.findAllStudent();
        model.addAttribute("allStudent",allStudent);

        return "admin/studentManagement";
    }

    //查询教师信息
    @RequestMapping("teacherManagement")
    public String teacherManagement(Model model) {

        List<Teacher> allTeacher = adminService.findAllTeacher();
        model.addAttribute("allTeacher",allTeacher);

        return "admin/teacherManagement";
    }

    //更新教师信息
    @RequestMapping("updateTeacherInformation")
    public String updateTeacherInformation(Model model, Teacher teacher) {

        adminService.updateTeacher(teacher);
        List<Teacher> allTeacher = adminService.findAllTeacher();
        model.addAttribute("allTeacher",allTeacher);

        return "admin/teacherManagement";
    }

    //添加教师信息
    @RequestMapping("addTeacherInformation")
    public String addTeacherInformation(Model model,Teacher teacher) {
        try{
            adminService.addLogin(teacher.getT_id(), 2);
            model.addAttribute("ok_addT","添加成功！");
        }catch (Exception exception){
            model.addAttribute("addTeacherError","该用户已存在！");
        }finally {
            List<Teacher> allTeacher = adminService.findAllTeacher();
            model.addAttribute("allTeacher",allTeacher);
            return "admin/teacherManagement";
        }
    }

    //删除教师信息
    @RequestMapping("deleteTeacherInformation")
    public String deleteTeacherInformation(Model model, HttpServletRequest request) {

        String t_id = request.getParameter("t_id");
        adminService.deleteTeacher(t_id);
        loginService.reset(t_id);
        List<Teacher> allTeacher = adminService.findAllTeacher();
        model.addAttribute("allTeacher",allTeacher);

        return "admin/teacherManagement";
    }

    //查询公司信息
    @RequestMapping("companyManagement")
    public String companyManagement(Model model) {

        List<Company> allCompany = adminService.findAllCompany();
        model.addAttribute("allCompany",allCompany);

        return "admin/empManagement";
    }

    //更新公司信息
    @RequestMapping("updateCompanyInformation")
    public String updateCompanyInformation(Model model, Company company) {

        adminService.updateCompany(company);
        List<Company> allCompany = adminService.findAllCompany();
        model.addAttribute("allCompany",allCompany);

        return "admin/empManagement";
    }

    //添加公司信息
    @RequestMapping("addCompanyInformation")
    public String addCompanyInformation(Model model,Company company) {
        try{
            adminService.addLogin(company.getCompany_person_id(), 3);
            model.addAttribute("ok_addC","添加成功！");
        }catch (Exception exception){
            model.addAttribute("addCompanyError","该用户已存在！");
        }finally {
            List<Company> allCompany = adminService.findAllCompany();
            model.addAttribute("allCompany",allCompany);
            return "admin/empManagement";
        }
    }

    //删除公司信息
    @RequestMapping("deleteCompanyInformation")
    public String deleteCompanyInformation(Model model, HttpServletRequest request) {

        String company_person_id = request.getParameter("company_person_id");
        adminService.deleteCompany(company_person_id);
        loginService.reset(company_person_id);
        List<Company> allCompany = adminService.findAllCompany();
        model.addAttribute("allCompany",allCompany);

        return "admin/empManagement";
    }

}
