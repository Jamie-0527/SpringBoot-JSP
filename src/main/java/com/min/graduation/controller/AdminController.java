package com.min.graduation.controller;


import com.min.graduation.entity.*;
import com.min.graduation.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
        session.invalidate();
        return "login";
    }

    //查询学生信息
    @RequestMapping("studentManagement")
    public String studentManagement(Model model, HttpSession session, @RequestParam("page") int page) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Student> allStudent = adminService.findAllStudent();
            //方便分页处理，固定每页10条数据
            Student[][] pageStudent = new Student[allStudent.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < allStudent.size()/10+1; i++){
                if (count < allStudent.size()){
                    for (int j = 0; j<10; j++){
                        if (count < allStudent.size()){
                            pageStudent[i][j] = allStudent.get(count);
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
            model.addAttribute("pageCount",allStudent.size()/10+1);
            model.addAttribute("allStudent",showStudent);
            return "admin/studentManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";

    }

    //更新学生信息
    @RequestMapping("updateStudentsInformation")
    public String updateStudentsInformation(Model model, HttpServletRequest request, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            //获取前端传来的数据
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
            model.addAttribute("ok_update","更新成功！");
            return "forward:studentManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //添加学生信息
    @RequestMapping("addStudentsInformation")
    public String addStudentsInformation(Model model, Student student, HttpSession session) {
        Integer Authority = (Integer) session.getAttribute("Authority");
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            try{
                adminService.addLogin(student.getS_id(), 1);
                model.addAttribute("ok_addS","添加成功！");
            }catch (Exception exception){
                model.addAttribute("addStudentError","该用户已存在！");
            }finally {
                if (Authority != null) {
                    if (Authority==0){
                        List<Student> allStudent = adminService.findAllStudent();
                        model.addAttribute("allStudent", allStudent);
                        return "admin/studentManagement";
                    }else if (Authority==2){
                        List<Teacher> classStudent = teacherService.findClassStudent(userName);
                        model.addAttribute("classStudent",classStudent);
                        return "teacher/studentManagement";
                    }else {
                        List<Student> companyStudent = companyService.findCompanyStudent(userName);
                        model.addAttribute("companyStudent",companyStudent);
                        return "company/studentManagement";
                    }
                }
                model.addAttribute("error","身份信息过期，请重新登录！");
                session.invalidate();
                return "login";
            }
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //删除学生信息
    @RequestMapping("deleteStudentsInformation")
    public String deleteStudentsInformation(Model model, HttpServletRequest request, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            String s_id = request.getParameter("s_id");
            adminService.deleteStudent(s_id);
            loginService.reset(s_id);
            List<Student> allStudent = adminService.findAllStudent();
            model.addAttribute("allStudent",allStudent);
            return "admin/studentManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询教师信息
    @RequestMapping("teacherManagement")
    public String teacherManagement(Model model, HttpSession session, @RequestParam("page") int page) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Teacher> allTeacher = adminService.findAllTeacher();
            //方便分页处理，固定每页10条数据
            Teacher[][] pageTeacher = new Teacher[allTeacher.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < allTeacher.size()/10+1; i++){
                if (count < allTeacher.size()){
                    for (int j = 0; j<10; j++){
                        if (count < allTeacher.size()){
                            pageTeacher[i][j] = allTeacher.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Teacher> showTeacher = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageTeacher[page-1][i] != null){
                    showTeacher.add(pageTeacher[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",allTeacher.size()/10+1);
            model.addAttribute("allTeacher",showTeacher);
            return "admin/teacherManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";

    }

    //更新教师信息
    @RequestMapping("updateTeacherInformation")
    public String updateTeacherInformation(Model model, Teacher teacher, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            adminService.updateTeacher(teacher);
            Teacher result = teacherService.personInformation(teacher.getT_id());
            model.addAttribute("ok_update","更新成功！");
            return "forward:teacherManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //添加教师信息
    @RequestMapping("addTeacherInformation")
    public String addTeacherInformation(Model model,Teacher teacher, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
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
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //删除教师信息
    @RequestMapping("deleteTeacherInformation")
    public String deleteTeacherInformation(Model model, HttpServletRequest request, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            String t_id = request.getParameter("t_id");
            adminService.deleteTeacher(t_id);
            loginService.reset(t_id);
            List<Teacher> allTeacher = adminService.findAllTeacher();
            model.addAttribute("allTeacher",allTeacher);
            return "admin/teacherManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";

    }

    //查询公司信息
    @RequestMapping("companyManagement")
    public String companyManagement(Model model, HttpSession session, @RequestParam("page") int page) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Company> allCompany = adminService.findAllCompany();
            //方便分页处理，固定每页10条数据
            Company[][] pageCompany = new Company[allCompany.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < allCompany.size()/10+1; i++){
                if (count < allCompany.size()){
                    for (int j = 0; j<10; j++){
                        if (count < allCompany.size()){
                            pageCompany[i][j] = allCompany.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Company> showCompany = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageCompany[page-1][i] != null){
                    showCompany.add(pageCompany[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",allCompany.size()/10+1);
            model.addAttribute("allCompany",showCompany);
            return "admin/CompanyManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //更新公司信息
    @RequestMapping("updateCompanyInformation")
    public String updateCompanyInformation(Model model, Company company, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            adminService.updateCompany(company);
            Company result = companyService.personInformation(company.getCompany_person_id());
            model.addAttribute("ok_update","更新成功！");
            return "forward:companyManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //添加公司信息
    @RequestMapping("addCompanyInformation")
    public String addCompanyInformation(Model model,Company company, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            try{
                adminService.addLogin(company.getCompany_person_id(), 3);
                model.addAttribute("ok_addC","添加成功！");
            }catch (Exception exception){
                model.addAttribute("addCompanyError","该用户已存在！");
                exception.printStackTrace();
            }finally {
                List<Company> allCompany = adminService.findAllCompany();
                model.addAttribute("allCompany",allCompany);
                return "admin/CompanyManagement";
            }
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //删除公司信息
    @RequestMapping("deleteCompanyInformation")
    public String deleteCompanyInformation(Model model, HttpServletRequest request, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            String company_person_id = request.getParameter("company_person_id");
            adminService.deleteCompany(company_person_id);
            loginService.reset(company_person_id);
            List<Company> allCompany = adminService.findAllCompany();
            model.addAttribute("allCompany",allCompany);
            return "admin/CompanyManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询学生账户信息
    @RequestMapping("studentAccountManagement")
    public String studentAccountManagement(Model model, HttpSession session, @RequestParam("page") int page) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Admin> studentAccount = adminService.findStudentAccount();
            //方便分页处理，固定每页10条数据
            Admin[][] pageAccount = new Admin[studentAccount.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < studentAccount.size()/10+1; i++){
                if (count < studentAccount.size()){
                    for (int j = 0; j<10; j++){
                        if (count < studentAccount.size()){
                            pageAccount[i][j] = studentAccount.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Admin> showAccount = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageAccount[page-1][i] != null){
                    showAccount.add(pageAccount[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",studentAccount.size()/10+1);
            model.addAttribute("studentAccount",showAccount);
            return "admin/studentAccountManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询教师账户信息
    @RequestMapping("teacherAccountManagement")
    public String teacherAccountManagement(Model model, HttpSession session, @RequestParam("page") int page) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Admin> teacherAccount = adminService.findTeacherAccount();
            //方便分页处理，固定每页10条数据
            Admin[][] pageAccount = new Admin[teacherAccount.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < teacherAccount.size()/10+1; i++){
                if (count < teacherAccount.size()){
                    for (int j = 0; j<10; j++){
                        if (count < teacherAccount.size()){
                            pageAccount[i][j] = teacherAccount.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Admin> showAccount = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageAccount[page-1][i] != null){
                    showAccount.add(pageAccount[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",teacherAccount.size()/10+1);
            model.addAttribute("teacherAccount",showAccount);
            return "admin/teacherAccountManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询企业员工账户信息
    @RequestMapping("companyAccountManagement")
    public String companyAccountManagement(Model model, HttpSession session, @RequestParam("page") int page) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Admin> companyAccount = adminService.findCompanyAccount();
            //方便分页处理，固定每页10条数据
            Admin[][] pageAccount = new Admin[companyAccount.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < companyAccount.size()/10+1; i++){
                if (count < companyAccount.size()){
                    for (int j = 0; j<10; j++){
                        if (count < companyAccount.size()){
                            pageAccount[i][j] = companyAccount.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Admin> showAccount = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageAccount[page-1][i] != null){
                    showAccount.add(pageAccount[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",companyAccount.size()/10+1);
            model.addAttribute("companyAccount",showAccount);
            return "admin/companyAccountManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //禁用账户信息
    @RequestMapping("disableAccount")
    public String disableAccount(Model model, String user_name, int authority, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
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
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //启用账户信息
    @RequestMapping("enableAccount")
    public String enableAccount(Model model, String user_name, int authority, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
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
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
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
        session.invalidate();
        return "login";
    }

    //查询所有提交的实训报告
    @RequestMapping("findAllReport")
    public String findAllReport(Model model, HttpSession session, @RequestParam("page") int page){

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> allReport = adminService.findAllReport();
            //添加排序规则---递增
            Collections.sort(allReport, new Comparator<Report>() {
                public int compare(Report arg0, Report arg1) {
                    return arg0.getReport_status().compareTo(arg1.getReport_status());
                }
            });
            //方便分页处理，固定每页10条数据
            Report[][] pageReport = new Report[allReport.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < allReport.size()/10+1; i++){
                if (count < allReport.size()){
                    for (int j = 0; j<10; j++){
                        if (count < allReport.size()){
                            pageReport[i][j] = allReport.get(count);
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
            model.addAttribute("pageCount",allReport.size()/10+1);
            model.addAttribute("allReport",showReport);
            return "admin/reportManagement";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }
}
