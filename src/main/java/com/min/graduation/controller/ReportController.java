package com.min.graduation.controller;

import com.min.graduation.entity.Report;
import com.min.graduation.service.ReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:21
 */
@Controller
@Slf4j
public class ReportController {

    @Autowired
    private ReportService reportService;

    @RequestMapping("test")
    public void test01(Report report){
        System.out.println(report);
    }

    //学生提交实训报告
    @RequestMapping("studentSubmitReport")
    public String studentSubmitReport(Model model, Report report, HttpServletRequest request){
        //String-->LocalTime格式转换
        String start_time = request.getParameter("start_time");
        String over_time = request.getParameter("over_time");
        report.setBegin_time(LocalDate.parse(start_time, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report.setEnd_time(LocalDate.parse(over_time, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        reportService.submitReport(report);
        model.addAttribute("ok_submit","提交成功！");
        return "forward:findMyReport";
    }

    //教师审核实训报告
    @RequestMapping("teacherReviewReport")
    public String teacherReviewReport(Model model, Report report, HttpServletRequest request){
        //数据类型转换
        String t_review_score = request.getParameter("t_review_score");
        report.setEmp_review_score(Integer.parseInt(t_review_score));
        reportService.teacherReviewReport(report);
        model.addAttribute("ok_submit","提交成功！");
        return "forward:teacherGetReport";
    }

    //企业人员审核实训报告
    @RequestMapping("companyReviewReport")
    public String companyReviewReport(Model model, Report report, HttpServletRequest request){
        //数据类型转换
        String emp_review_score = request.getParameter("emp_review_score");
        report.setEmp_review_score(Integer.parseInt(emp_review_score));
        reportService.companyReviewReport(report);
        model.addAttribute("ok_submit","提交成功！");
        return "forward:getCompanyReport";
    }

    //打回实训报告重做
    @RequestMapping("backReDo")
    public String backReDo(HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        String id = request.getParameter("id");
        String s_id = request.getParameter("s_id");
        //类型转换
        int conversion = Integer.parseInt(id);
        map.put("id",conversion);
        map.put("s_id",s_id);
        reportService.backReDo(map);
        return "forward:teacherGetReport";
    }

}
