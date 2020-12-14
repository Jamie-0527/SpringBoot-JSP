package com.min.graduation.controller;

import com.min.graduation.entity.Report;
import com.min.graduation.service.ReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
    public void test01(HttpServletRequest request){
        System.out.println(request.getParameter("t_review_score"));
        System.out.println("访问了");
    }

    @RequestMapping("studentSubmitReport")
    public void studentSubmitReport(Report report, HttpServletRequest request){
        //String-->LocalTime格式转换
        String start_time = request.getParameter("start_time");
        String over_time = request.getParameter("over_time");
        report.setBegin_time(LocalDate.parse(start_time, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        report.setEnd_time(LocalDate.parse(over_time, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        System.out.println(report);
        reportService.submitReport(report);
        log.info("---提交了");
    }

    @RequestMapping("teacherReviewReport")
    public void teacherReviewReport(Report report, HttpServletRequest request){
        System.out.println(report);
        log.info("---提交了");
    }
}
