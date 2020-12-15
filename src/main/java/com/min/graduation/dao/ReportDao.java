package com.min.graduation.dao;

import com.min.graduation.entity.Report;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:19
 */
@Repository
public interface ReportDao {

    //学生提交报告
    int submitReport(Report report);

    //教师审核报告
    int teacherReviewReport(Report report);

    //企业人员审核报告
    int companyReviewReport(Report report);

    //实训报告打回重做
    int backReDo(Map<String,Object> map);

}
