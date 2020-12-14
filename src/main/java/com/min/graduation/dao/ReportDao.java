package com.min.graduation.dao;

import com.min.graduation.entity.Report;
import org.springframework.stereotype.Repository;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:19
 */
@Repository
public interface ReportDao {

    //学生提交报告
    int submitReport(Report report);

    //教师审批报告
    int teacherReviewReport(Report report);
}
