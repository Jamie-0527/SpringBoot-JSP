package com.min.graduation.controller;

import com.min.graduation.entity.*;
import com.min.graduation.service.AdminService;
import com.min.graduation.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String companyStudentInformation(Model model, HttpSession session, @RequestParam("page") int page) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Student> companyStudent = companyService.findCompanyStudent(userName);
            //方便分页处理，固定每页10条数据
            Student[][] pageStudent = new Student[companyStudent.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < companyStudent.size()/10+1; i++){
                if (count < companyStudent.size()){
                    for (int j = 0; j<10; j++){
                        if (count < companyStudent.size()){
                            pageStudent[i][j] = companyStudent.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Student> showStudent = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageStudent[page-1][i] != null){
                    showStudent.add(pageStudent[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",companyStudent.size()/10+1);
            model.addAttribute("companyStudent",showStudent);
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
            model.addAttribute("ok_update","更新成功！");
            return "redirect:companyStudentInformation"+"?page=1";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询实训学生提交的实训报告
    @RequestMapping("getCompanyReport")
    public String getCompanyReport(Model model, HttpSession session, @RequestParam("page") int page) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> companyReport = companyService.getCompanyReport(userName);
            //添加排序规则---递增
            Collections.sort(companyReport, new Comparator<Report>() {
                public int compare(Report arg0, Report arg1) {
                    return arg0.getReport_status().compareTo(arg1.getReport_status());
                }
            });
            //方便分页处理，固定每页10条数据
            Report[][] pageReport = new Report[companyReport.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < companyReport.size()/10+1; i++){
                if (count < companyReport.size()){
                    for (int j = 0; j<10; j++){
                        if (count < companyReport.size()){
                            pageReport[i][j] = companyReport.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Report> showReport = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageReport[page-1][i] != null){
                    showReport.add(pageReport[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",companyReport.size()/10+1);
            model.addAttribute("companyReport",showReport);
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
