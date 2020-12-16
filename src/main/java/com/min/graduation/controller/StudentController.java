package com.min.graduation.controller;

import com.min.graduation.entity.Company;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.CompanyService;
import com.min.graduation.service.StudentService;
import com.min.graduation.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 此类为Student的表现层
 */

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private CompanyService companyService;

    //查询个人信息
    @RequestMapping("studentPersonInformation")
    public String studentPersonInformation(Model model, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            Student student = studentService.personInformation(userName);
            model.addAttribute("student",student);
            return "student/studentInformation";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }



    //查询班级同学信息
    @RequestMapping("studentGradeInformation")
    public String studentGradeInformation(Model model,String cname){

        /*更新后查询班级信息并跳转*/
        List<Student> list = studentService.findGradeStudent(cname);

        model.addAttribute("listStudent",list);

        return "student/gradeInformation";
    }

    //查询实习公司信息
    @RequestMapping("studentCompanyInformation")
    public String studentCompanyInformation(Model model,String sName){

        /*更新后查询班级信息并跳转*/
        Student company = studentService.findCompany(sName);

        model.addAttribute("studentCompany",company);

        return "student/companyInformation";
    }

    //查询我提交的实训报告
    @RequestMapping("findMyReport")
    public String findMyReport(Model model, HttpSession session){

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> myReport = studentService.myReport(userName);
            model.addAttribute("myReport",myReport);
            return "student/trainingReport";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }

    //根据学号查询实训报告
    @RequestMapping("findReportById")
    public String findReportById(Model model, String s_id, HttpSession session){

        String userName = (String) session.getAttribute("userName");
        int authority = (int) session.getAttribute("Authority");
        if (userName != null && userName != ""){
            List<Report> reportById = studentService.myReport(s_id);
            if (authority==0){
                model.addAttribute("allReport",reportById);
                return "admin/reportManagement";
            }else if (authority==2){
                model.addAttribute("gradeReport",reportById);
                //获取教师个人信息，提高用户体验
                Teacher teacher = teacherService.personInformation(userName);
                model.addAttribute("teacher",teacher);
                return "teacher/reportManagement";
            }else if (authority==3){
                model.addAttribute("companyReport",reportById);
                //获取教师个人信息，提高用户体验
                Company company = companyService.personInformation(userName);
                model.addAttribute("company",company);
                return "company/reportManagement";
            }
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }
}
