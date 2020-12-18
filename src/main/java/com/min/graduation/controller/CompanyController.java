package com.min.graduation.controller;

import com.min.graduation.entity.*;
import com.min.graduation.service.AdminService;
import com.min.graduation.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author zhangjiamin
 * @date 2020/12/11 18:00
 */
@Controller
public class CompanyController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private AdminService adminService;


    //主页
    @RequestMapping("companyToHome")
    public String teacherToHome(Model model, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> companyReport = companyService.getCompanyReport(userName);
            for (Report report : companyReport){
                Date now = new Date();
                long time = now.getTime()-report.getCommit_time().getTime();
                report.setUpdatedOn(time/(1000*60*60));
            }
            //添加排序规则---递增
            Collections.sort(companyReport, new Comparator<Report>() {
                public int compare(Report arg0, Report arg1) {
                    return arg0.getUpdatedOn().compareTo(arg1.getUpdatedOn());
                }
            });
            //倒叙
            //Collections.reverse(companyReport);
            model.addAttribute("news",companyReport);
            return "company/home";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询公司信息
    @RequestMapping("companyPersonInformation")
    public String companyPersonInformation(Model model, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            Company company = companyService.personInformation(userName);
            model.addAttribute("company",company);

            return "company/companyInformation";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //更新公司信息
    @RequestMapping("companyUpdateInformation")
    public String companyUpdateInformation(Model model, Company company, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            adminService.updateCompany(company);
            Company result = companyService.personInformation(company.getCompany_person_id());
            model.addAttribute("company",result);
            model.addAttribute("ok_update","更新成功！");
            return "company/companyInformation";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";

    }

    //查询公司实训学生信息
    @RequestMapping("companyStudentInformation")
    public String companyStudentInformation(Model model, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Student> companyStudent = companyService.findCompanyStudent(userName);
            model.addAttribute("companyStudent",companyStudent);
            return "company/studentManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //更新学生信息
    @RequestMapping("companyUpdateSInfo")
    public String updateStudentsInformation(Model model, HttpServletRequest request, HttpSession session) {
        //获取前端传来的数据
        String s_id = request.getParameter("s_id");
        String s_name = request.getParameter("s_name");
        String s_phone = request.getParameter("s_phone");

        String userName = (String) session.getAttribute("userName");

        if (userName != null && userName != ""){
            //更新学生对象
            Student student = new Student();
            student.setS_id(s_id);
            student.setS_name(s_name);
            student.setS_phone(s_phone);
            companyService.c_updateInfo(student);
            //查询数据并返回
            List<Student> companyStudent = companyService.findCompanyStudent(userName);
            model.addAttribute("companyStudent",companyStudent);
            model.addAttribute("ok_update","更新成功！");
            return "company/studentManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询实训学生提交的实训报告
    @RequestMapping("getCompanyReport")
    public String getCompanyReport(Model model, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> companyReport = companyService.getCompanyReport(userName);
            //添加排序规则---递增
            Collections.sort(companyReport, new Comparator<Report>() {
                public int compare(Report arg0, Report arg1) {
                    return arg0.getReport_status().compareTo(arg1.getReport_status());
                }
            });
            model.addAttribute("companyReport",companyReport);
            //获取教师个人信息，提高用户体验
            Company company = companyService.personInformation(userName);
            model.addAttribute("company",company);

            return "company/reportManagement";
        }

        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }
}
