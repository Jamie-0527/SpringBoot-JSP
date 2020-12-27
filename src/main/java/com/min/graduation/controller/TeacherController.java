package com.min.graduation.controller;

import com.min.graduation.entity.Grade;
import com.min.graduation.entity.Report;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.AdminService;
import com.min.graduation.service.StudentService;
import com.min.graduation.service.TeacherService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * 此类为Teacher对象的控制层
 */
@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;


    //主页
    @RequestMapping("teacherToHome")
    public String teacherToHome(Model model, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> result = new ArrayList<>();
            //获取班级学生实训报告
            List<Grade> gradeList = teacherService.getGradeName(userName);
            for (Grade grade : gradeList){
                List<Report> gradeReport= teacherService.getGradeReportNoFormat(grade.getC_name());
                for (Report report : gradeReport){
                    Date now = new Date();
                    long time = now.getTime()-report.getCommit_time().getTime();
                    report.setUpdatedOn(time/(1000*60*60));
                    result.add(report);
                }
            }
            //添加排序规则---递增
            Collections.sort(result, new Comparator<Report>() {
                public int compare(Report arg0, Report arg1) {
                    return arg0.getUpdatedOn().compareTo(arg1.getUpdatedOn());
                }
            });
            //倒叙
            //Collections.reverse(result);
            model.addAttribute("news",result);
            return "teacher/home";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询个人信息
    @RequestMapping("teacherPersonInformation")
    public String teacherPersonInformation(Model model, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            Teacher teacher = teacherService.personInformation(userName);
            model.addAttribute("teacher",teacher);
            return "teacher/teacherInformation";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //更新教师信息
    @RequestMapping("teacherUpdateInformation")
    public String teacherUpdateInformation(Model model, Teacher teacher, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            adminService.updateTeacher(teacher);
            Teacher result = teacherService.personInformation(teacher.getT_id());
            model.addAttribute("teacher",result);
            model.addAttribute("ok_update","更新成功！");
            return "teacher/teacherInformation";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //查询班级学生信息
    @RequestMapping("teacherGradeInformation")
    public String teacherGradeInformation(Model model, HttpSession session, @Param("page") int page) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Teacher> classStudent = teacherService.findClassStudent(userName);
            //方便分页处理，固定每页10条数据
            Teacher[][] pageStudent = new Teacher[classStudent.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < classStudent.size()/10+1; i++){
                if (count < classStudent.size()){
                    for (int j = 0; j<10; j++){
                        if (count < classStudent.size()){
                            pageStudent[i][j] = classStudent.get(count);
                            count++;
                        } else { break; }
                    }
                } else { break; }
            }
            List<Teacher> showStudent = new ArrayList<>();
            for (int i = 0; i < 10; i++){
                if (pageStudent[page-1][i] != null){
                    showStudent.add(pageStudent[page-1][i]);
                }
            }
            model.addAttribute("pageNum",page);
            model.addAttribute("pageCount",classStudent.size()/10+1);
            model.addAttribute("classStudent",showStudent);
            return "teacher/studentManagement";
        }

        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //更新学生信息
    @RequestMapping("teacherUpdateSInfo")
    public String updateStudentsInformation(Model model, HttpServletRequest request, HttpSession session) {
        //获取前端传来的数据
        String s_id = request.getParameter("s_id");
        String s_name = request.getParameter("s_name");
        String c_name = request.getParameter("c_name");
        String s_phone = request.getParameter("s_phone");

        String userName = (String) session.getAttribute("userName");

        if (userName != null && userName != ""){
            /*匹配班级ID*/
            List<Grade> gradeInfo = studentService.findGradeInfo(c_name);
            Student student = new Student(s_id,s_name,gradeInfo.get(0).getC_id(),s_phone);
            //更新学生对象
            teacherService.t_updateInfo(student);
            //查询数据并返回
            List<Teacher> classStudent = teacherService.findClassStudent(userName);

            model.addAttribute("classStudent",classStudent);
            model.addAttribute("ok_update","更新成功！");
            return "teacher/studentManagement";
        }

        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";

    }

    //获取学生的实训报告
    @RequestMapping("teacherGetReport")
    public String teacherGetReport(Model model, HttpSession session, @Param("page") int page) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            List<Report> result = new ArrayList<>();
            //获取班级学生实训报告
            List<Grade> gradeList = teacherService.getGradeName(userName);
            for (Grade grade : gradeList){
                List<Report> gradeReport= teacherService.getGradeReport(grade.getC_name());
                for (Report report : gradeReport){
                    result.add(report);
                }
            }
            //添加排序规则---递增
            Collections.sort(result, new Comparator<Report>() {
                public int compare(Report arg0, Report arg1) {
                    return arg0.getReport_status().compareTo(arg1.getReport_status());
                }
            });
            //方便分页处理，固定每页10条数据
            Report[][] pageReport = new Report[result.size()/10+1][10];
            int count = 0;
            // 将对象封装在一个二维数组当中，方便页面取出
            for (int i = 0; i < result.size()/10+1; i++){
                if (count < result.size()){
                    for (int j = 0; j<10; j++){
                        if (count < result.size()){
                            pageReport[i][j] = result.get(count);
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
            model.addAttribute("pageCount",result.size()/10+1);
            //获取教师个人信息，提高用户体验
            Teacher teacher = teacherService.personInformation(userName);
            model.addAttribute("teacher",teacher);
            model.addAttribute("gradeReport",showReport);
            return "teacher/reportManagement";
        }

        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

}
