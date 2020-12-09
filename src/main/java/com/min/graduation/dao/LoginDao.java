package com.min.graduation.dao;

import com.min.graduation.entity.Login;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 此类为学生实体类（Login）的Dao层接口
 */

@Repository
public interface LoginDao {

    //用户登录
    Login login(@Param("uname") String username);

    //初始化密码
    int update(@Param("uname") String username, @Param("password") String password);

    //重置账号
    int reset(@Param("uname") String username);

}
