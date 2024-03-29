package com.min.graduation.controller;

import com.min.graduation.entity.Login;
import com.min.graduation.entity.Report;
import com.min.graduation.service.AdminService;
import com.min.graduation.service.ReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:21
 */
@Controller
@Slf4j
public class ReportController {

    @Autowired
    private ReportService reportService;


    //学生提交实训报告
    @RequestMapping("studentSubmitReport")
    public String studentSubmitReport(Model model, Report report, HttpServletRequest request, HttpSession session){
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            if (report.getReport_status()==null){
                //String-->LocalTime格式转换
                String start_time = request.getParameter("start_time");
                String over_time = request.getParameter("over_time");
                report.setBegin_time(LocalDate.parse(start_time, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                report.setEnd_time(LocalDate.parse(over_time, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                report.setReport_context(report.getReport_context().trim());
                report.setReport_experience(report.getReport_experience().trim());
                reportService.submitReport(report);
                model.addAttribute("ok_submit","提交成功！");
            }else {
                reportService.reSubmitReport(report);
                model.addAttribute("ok_submit","提交成功！");
            }
            return "redirect:findMyReport"+"?page=1";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //教师审核实训报告
    @RequestMapping("teacherReviewReport")
    public String teacherReviewReport(Model model, Report report, HttpServletRequest request, HttpSession session){
        //数据类型转换
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            String t_review_score = request.getParameter("t_review_score");
            report.setEmp_review_score(Integer.parseInt(t_review_score));
            report.setT_review_opinion(report.getT_review_opinion().trim());
            reportService.teacherReviewReport(report);
            model.addAttribute("ok_submit","提交成功！");
            return "redirect:teacherGetReport"+"?page=1";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //企业人员审核实训报告
    @RequestMapping("companyReviewReport")
    public String companyReviewReport(Model model, Report report, HttpServletRequest request, HttpSession session){
        //数据类型转换
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            String emp_review_score = request.getParameter("emp_review_score");
            report.setEmp_review_score(Integer.parseInt(emp_review_score));
            report.setEmp_review_opinion(report.getEmp_review_opinion().trim());
            reportService.companyReviewReport(report);
            model.addAttribute("ok_submit","提交成功！");
            return "redirect:getCompanyReport"+"?page=1";
        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

    //打回实训报告重做
    @RequestMapping("backReDo")
    public String backReDo(HttpServletRequest request, HttpSession session, Model model){
        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            // 获取权限
            Login login = reportService.getAuthority(userName);

            Map<String,Object> map = new HashMap<>();
            String id = request.getParameter("id");
            String s_id = request.getParameter("s_id");
            //类型转换
            int conversion = Integer.parseInt(id);
            map.put("id",conversion);
            map.put("s_id",s_id);
            reportService.backReDo(map);
            if (login.getAuthority() == 2){
                return "redirect:teacherGetReport"+"?page=1";
            }else {
                return "redirect:getCompanyReport"+"?page=1";
            }

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        session.invalidate();
        return "login";
    }

}
