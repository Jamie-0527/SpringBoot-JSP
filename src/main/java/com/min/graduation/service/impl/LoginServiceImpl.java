package com.min.graduation.service.impl;

import com.min.graduation.dao.LoginDao;
import com.min.graduation.entity.Login;
import com.min.graduation.service.LoginService;

import com.min.graduation.utils.Md5Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;
    @Autowired
    private Md5Encryption md5Encryption;

    @Override
    public Login login(String username) {
        return loginDao.login(username);
    }

    @Override
    public int update(String username, String password) {
        String cipherText = md5Encryption.setEncryption(password);
        return loginDao.update(username, cipherText);
    }

    @Override
    public int reset(String username) {
        return loginDao.reset(username);
    }
}
