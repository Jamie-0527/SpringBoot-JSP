package com.min.graduation.service;

import com.min.graduation.entity.Company;

/**
 * @author zhangjiamin
 * @date 2020/12/11 17:56
 */
public interface CompanyService {

    //查询个人信息
    Company personInformation(String company_person_id);
}
