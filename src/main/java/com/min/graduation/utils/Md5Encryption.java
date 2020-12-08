package com.min.graduation.utils;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;


/**
 * @author zhangjiamin
 * @date 2020/12/6 11:19
 *
 * 此类为用户密码加密类
 */
@Service
public class Md5Encryption {

    public String setEncryption(String password){
        //复杂化加密过程
        password = password+"min";
        return DigestUtils.md5DigestAsHex(password.getBytes());
    }

}
