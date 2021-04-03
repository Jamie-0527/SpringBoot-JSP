package com.min.graduation.service.impl;

import com.min.graduation.dao.LoginDao;
import com.min.graduation.entity.Company;
import com.min.graduation.entity.Login;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
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

//    @Override
//    public int updatePassword(String user_name, String password) {
//        String cipherText = md5Encryption.setEncryption(password);
//        return loginDao.updatePassword(user_name, cipherText);
//    }

    @Override
    public Student getStudentName(String s_id) {
        return loginDao.getStudentName(s_id);
    }

    @Override
    public Teacher getTeacherName(String t_id) {
        return loginDao.getTeacherName(t_id);
    }

    @Override
    public Company getCompanyPersonName(String company_person_id) {
        return loginDao.getCompanyPersonName(company_person_id);
    }
}
