package com.min.graduation.dao;

import com.min.graduation.entity.Company;
import org.springframework.stereotype.Repository;

/**
 * @author zhangjiamin
 * @date 2020/12/11 17:51
 */
@Repository
public interface CompanyDao {

    //查询个人信息
    Company personInformation(String company_person_id);
}
