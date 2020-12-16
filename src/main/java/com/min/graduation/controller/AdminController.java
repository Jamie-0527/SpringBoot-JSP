package com.min.graduation.controller;


import com.min.graduation.entity.*;
import com.min.graduation.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CompanyService companyService;


    //主页
    @RequestMapping("adminToHome")
    public String adminToHome(Model model, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            return "admin/home";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }

    //查询学生信息
    @RequestMapping("studentManagement")
    public String studentManagement(Model model) {

        List<Student> allStudent = adminService.findAllStudent();
        model.addAttribute("allStudent",allStudent);

        return "admin/studentManagement";
    }

    //更新学生信息
    @RequestMapping("updateStudentsInformation")
    public String updateStudentsInformation(Model model, HttpServletRequest request) {
        //获取前端传来的数据
        String s_id = request.getParameter("s_id");
        String s_name = request.getParameter("s_name");
        String c_name = request.getParameter("c_name");
        String s_phone = request.getParameter("s_phone");
        String s_college = request.getParameter("s_college");
        String company_name = request.getParameter("company_name");

        /*匹配班级ID*/
        Grade gradeInfo = studentService.findGradeInfo(c_name);
        if (company_name.length()==0){
            Student student = new Student(s_id,s_name,gradeInfo.getC_id(),s_phone,s_college);
            adminService.updateStudent(student);

        }else {
            Student student = new Student(s_id,s_name,gradeInfo.getC_id(),s_phone,s_college,company_name);
            adminService.updateStudent(student);
        }
        Student student = studentService.personInformation(s_id);
        model.addAttribute("student",student);
        model.addAttribute("ok_update","更新成功！");
        return "student/studentInformation";
    }

    //添加学生信息
    @RequestMapping("addStudentsInformation")
    public String addStudentsInformation(Model model, Student student, HttpSession session) {

        try{
            adminService.addLogin(student.getS_id(), 1);
            model.addAttribute("ok_addS","添加成功！");
        }catch (Exception exception){
            model.addAttribute("addStudentError","该用户已存在！");
        }finally {
            Integer Authority = (Integer) session.getAttribute("Authority");
            String userName = (String) session.getAttribute("userName");
            if (Authority != null) {
                if (Authority==0){
                    List<Student> allStudent = adminService.findAllStudent();
                    model.addAttribute("allStudent", allStudent);
                    return "admin/studentManagement";
                }else if (userName != null && userName != ""){
                    if (Authority==2){
                        List<Teacher> classStudent = teacherService.findClassStudent(userName);
                        model.addAttribute("classStudent",classStudent);
                        return "teacher/studentManagement";
                    }else {
                        List<Student> companyStudent = companyService.findCompanyStudent(userName);
                        model.addAttribute("companyStudent",companyStudent);
                        return "company/studentManagement";
                    }

                }else {
                    model.addAttribute("error","身份信息过期，请重新登录！");
                    return "login";
                }
            }
            model.addAttribute("error","身份信息过期，请重新登录！");
            return "login";
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
        Teacher result = teacherService.personInformation(teacher.getT_id());
        model.addAttribute("teacher",result);
        model.addAttribute("ok_update","更新成功！");

        return "teacher/teacherInformation";
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

        return "admin/CompanyManagement";
    }

    //更新公司信息
    @RequestMapping("updateCompanyInformation")
    public String updateCompanyInformation(Model model, Company company) {

        adminService.updateCompany(company);
        Company result = companyService.personInformation(company.getCompany_person_id());
        model.addAttribute("company",result);
        model.addAttribute("ok_update","更新成功！");

        return "company/companyInformation";
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
            return "admin/CompanyManagement";
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

        return "admin/CompanyManagement";
    }

    //查询学生账户信息
    @RequestMapping("studentAccountManagement")
    public String studentAccountManagement(Model model) {

        List<Admin> studentAccount = adminService.findStudentAccount();
        model.addAttribute("studentAccount",studentAccount);

        return "admin/studentAccountManagement";
    }

    //查询教师账户信息
    @RequestMapping("teacherAccountManagement")
    public String teacherAccountManagement(Model model) {

        List<Admin> teacherAccount = adminService.findTeacherAccount();
        model.addAttribute("teacherAccount",teacherAccount);

        return "admin/teacherAccountManagement";
    }

    //查询企业员工账户信息
    @RequestMapping("companyAccountManagement")
    public String companyAccountManagement(Model model) {

        List<Admin> companyAccount = adminService.findCompanyAccount();
        model.addAttribute("companyAccount",companyAccount);

        return "admin/companyAccountManagement";
    }

    //禁用账户信息
    @RequestMapping("disableAccount")
    public String disableAccount(Model model, String user_name, int authority) {

        adminService.disableAccount(user_name);
        if (authority==1){
            List<Admin> studentAccount = adminService.findStudentAccount();
            model.addAttribute("studentAccount",studentAccount);

            return "admin/studentAccountManagement";
        }else if (authority==2){
            List<Admin> teacherAccount = adminService.findTeacherAccount();
            model.addAttribute("teacherAccount",teacherAccount);

            return "admin/teacherAccountManagement";
        }else {
            List<Admin> companyAccount = adminService.findCompanyAccount();
            model.addAttribute("companyAccount",companyAccount);

            return "admin/companyAccountManagement";
        }
    }

    //启用账户信息
    @RequestMapping("enableAccount")
    public String enableAccount(Model model, String user_name, int authority) {

        adminService.enableAccount(user_name);
        if (authority==1){
            List<Admin> studentAccount = adminService.findStudentAccount();
            model.addAttribute("studentAccount",studentAccount);

            return "admin/studentAccountManagement";
        }else if (authority==2){
            List<Admin> teacherAccount = adminService.findTeacherAccount();
            model.addAttribute("teacherAccount",teacherAccount);

            return "admin/teacherAccountManagement";
        }else {
            List<Admin> companyAccount = adminService.findCompanyAccount();
            model.addAttribute("companyAccount",companyAccount);

            return "admin/companyAccountManagement";
        }
    }

    //获取账户信息
    @RequestMapping("adminToUpdatePassword")
    public String adminToUpdatePassword(HttpSession session, Model model){

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            Login login = adminService.findAccountByUserName(userName);
            model.addAttribute("login",login);
            return "component/updatePassword";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }

    //查询所有提交的实训报告
    @RequestMapping("findAllReport")
    public String findAllReport(Model model, HttpSession session){

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> allReport = adminService.findAllReport();
            model.addAttribute("allReport",allReport);
            return "admin/reportManagement";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }
}
