package com.min.graduation.service;

import com.min.graduation.entity.Login;
import org.apache.ibatis.annotations.Param;

/**
 * 此类为学生实体类（Login）的Service层接口
 */

public interface LoginService {

    //用户登录
    Login login(String username);

    //用户注册
    int register(Login login);

    //初始化密码
    int update(String username, String password);

    //重置账号
    int reset(String username);

}
