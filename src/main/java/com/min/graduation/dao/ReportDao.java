package com.min.graduation.dao;

import com.min.graduation.entity.Login;
import com.min.graduation.entity.Report;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:19
 */
@Mapper
public interface ReportDao {

    //学生提交报告
    int submitReport(Report report);

    //教师审核报告
    int teacherReviewReport(Report report);

    //企业人员审核报告
    int companyReviewReport(Report report);

    //实训报告打回重做
    int backReDo(Map<String,Object> map);

    //重新提交实训报告---update
    int reSubmitReport(Report report);

    // 获取用户权限
    Login getAuthority(@Param("uname") String username);

}
