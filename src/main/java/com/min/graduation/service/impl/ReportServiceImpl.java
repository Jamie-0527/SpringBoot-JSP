package com.min.graduation.service.impl;

import com.min.graduation.dao.ReportDao;
import com.min.graduation.entity.Login;
import com.min.graduation.entity.Report;
import com.min.graduation.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:19
 */
@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportDao reportDao;

    @Override
    public int submitReport(Report report) {
        return reportDao.submitReport(report);
    }

    @Override
    public int teacherReviewReport(Report report) {
        return reportDao.teacherReviewReport(report);
    }

    @Override
    public int companyReviewReport(Report report) {
        return reportDao.companyReviewReport(report);
    }

    @Override
    public int backReDo(Map<String, Object> map) {
        return reportDao.backReDo(map);
    }

    @Override
    public int reSubmitReport(Report report) {
        return reportDao.reSubmitReport(report);
    }

    @Override
    public Login getAuthority(String username) {
        return reportDao.getAuthority(username);
    }
}
