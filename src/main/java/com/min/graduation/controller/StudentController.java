package com.min.graduation.controller;

import com.min.graduation.entity.*;
import com.min.graduation.service.AdminService;
import com.min.graduation.service.CompanyService;
import com.min.graduation.service.StudentService;
import com.min.graduation.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
    @Autowired
    private AdminService adminService;


    //主页
    @RequestMapping("studentToHome")
    public String studentToHome(Model model, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            return "student/home";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }

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

    //更新个人信息
    @RequestMapping("studentUpdateInformation")
    public String studentUpdateInformation(Model model, HttpServletRequest request, HttpSession session) {
        //获取前端传来的数据
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            String s_id = request.getParameter("s_id");
            String s_name = request.getParameter("s_name");
            String c_name = request.getParameter("c_name");
            String s_phone = request.getParameter("s_phone");
            String s_college = request.getParameter("s_college");
            String company_name = request.getParameter("company_name");

            /*匹配班级ID*/
            List<Grade> gradeInfo = studentService.findGradeInfo(c_name);
            if (company_name.length()==0){
                Student student = new Student(s_id,s_name,gradeInfo.get(0).getC_id(),s_phone,s_college);
                adminService.updateStudent(student);

            }else {
                Student student = new Student(s_id,s_name,gradeInfo.get(0).getC_id(),s_phone,s_college,company_name);
                adminService.updateStudent(student);
            }
            Student student = studentService.personInformation(s_id);
            model.addAttribute("student",student);
            model.addAttribute("ok_update","更新成功！");
            return "student/studentInformation";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

//    //查询班级同学信息
//    @RequestMapping("studentGradeInformation")
//    public String studentGradeInformation(Model model,String cname){
//
//        /*更新后查询班级信息并跳转*/
//        List<Student> list = studentService.findGradeStudent(cname);
//
//        model.addAttribute("listStudent",list);
//
//        return "student/gradeInformation";
//    }
//
//    //查询实习公司信息
//    @RequestMapping("studentCompanyInformation")
//    public String studentCompanyInformation(Model model,String sName){
//
//        /*更新后查询班级信息并跳转*/
//        Student company = studentService.findCompany(sName);
//
//        model.addAttribute("studentCompany",company);
//
//        return "student/companyInformation";
//    }

    //查询我提交的实训报告
    @RequestMapping("findMyReport")
    public String findMyReport(Model model, HttpSession session, @RequestParam("page") int page){

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> myReport = studentService.myReport(userName);
            //添加排序规则---递增
            Collections.sort(myReport, new Comparator<Report>() {
                public int compare(Report arg0, Report arg1) {
                    return arg0.getReport_status().compareTo(arg1.getReport_status());
                }
            });
            //方便分页处理，固定每页10条数据
            Report[][] pageReport = new Report[myReport.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < myReport.size()/10+1; i++){
                if (count < myReport.size()){
                    for (int j = 0; j<10; j++){
                        if (count < myReport.size()){
                            pageReport[i][j] = myReport.get(count);
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
            model.addAttribute("pageCount",myReport.size()/10+1);
            model.addAttribute("myReport",showReport);
            return "student/trainingReport";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //根据学号查询实训报告
    @RequestMapping("findReportById")
    public String findReportById(Model model, String s_id, HttpSession session, @RequestParam("page") int page){

        String userName = (String) session.getAttribute("userName");
        int authority = (int) session.getAttribute("Authority");
        if (userName != null && userName != ""){
            List<Report> reportById = studentService.myReport(s_id);
            //方便分页处理，固定每页10条数据
            Report[][] pageReport = new Report[reportById.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < reportById.size()/10+1; i++){
                if (count < reportById.size()){
                    for (int j = 0; j<10; j++){
                        if (count < reportById.size()){
                            pageReport[i][j] = reportById.get(count);
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
            model.addAttribute("pageCount",reportById.size()/10+1);
            if (authority==0){
                model.addAttribute("allReport",showReport);
                return "admin/reportManagement";
            }else if (authority==2){
                model.addAttribute("gradeReport",showReport);
                //获取教师个人信息，提高用户体验
                Teacher teacher = teacherService.personInformation(userName);
                model.addAttribute("teacher",teacher);
                return "teacher/reportManagement";
            }else if (authority==3){
                model.addAttribute("companyReport",showReport);
                //获取教师个人信息，提高用户体验
                Company company = companyService.personInformation(userName);
                model.addAttribute("company",company);
                return "company/reportManagement";
            }
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }
}
