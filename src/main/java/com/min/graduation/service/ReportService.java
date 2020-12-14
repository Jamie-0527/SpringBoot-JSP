package com.min.graduation.service;

import com.min.graduation.entity.Report;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:19
 */
public interface ReportService {

    //学生提交报告
    int submitReport(Report report);

    //教师审批报告
    int teacherReviewReport(Report report);
}
