package com.min.graduation.controller;


import com.min.graduation.entity.Login;
import com.min.graduation.entity.Student;
import com.min.graduation.entity.Teacher;
import com.min.graduation.service.LoginService;
import com.min.graduation.service.StudentService;
import com.min.graduation.service.TeacherService;
import com.min.graduation.utils.Md5Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private Md5Encryption md5Encryption;


    @RequestMapping("login")
    public String loginUser(HttpServletRequest request, Model model){

        try {
            //获得用户输入的密码，进行md5算法换算后与数据匹配
            String pwd = request.getParameter("password");
            String loginName = request.getParameter("loginName");
            Login l = loginService.login(loginName);

            //账号密码不为空
            if ( (pwd!=null && pwd!="") && (loginName!=null && loginName!="")){
                //如果密码为123456，则跳转强制修改密码和完善信息
                if ("123456".equals(l.getPassword())){
                    model.addAttribute("init",l);
                    return "component/init";
                }else{
                    //账号状态有效
                    if (l.getStatus()==0){
                        //将当前密码转义在数据库进行校验
                        String password = md5Encryption.setEncryption(pwd);
                        if (password.equals(l.getPassword())){
                            //密码正确则判断权限 超级管理员0、学生1、教师2、企业员工3
                            if (l.getAuthority() == 0){
                                String userName = l.getUserName();
                                model.addAttribute("userName",userName);
                                return "admin/home";

                            }else if (l.getAuthority() == 1){
                                /*获得用户名*/
                                String userName = l.getUserName();
                                //获取学生对象的信息，便于前端设值session
                                Student student = studentService.personInformation(userName);
                                model.addAttribute("student",student);
                                return "student/home";

                            }else if (l.getAuthority() == 2) {

                                /*获得用户名*/
                                String userName = l.getUserName();
                                //获取学生对象的信息，便于前端设值session
                                Teacher teacher = teacherService.personInformation(userName);
                                model.addAttribute("teacher",teacher);
                                return "teacher/home";

                            }else if (l.getAuthority() == 3) {

                                /*获得用户名*/
                                String userName = l.getUserName();
                                //获取学生对象的信息，便于前端设值session
                                Teacher teacher = teacherService.personInformation(userName);
                                model.addAttribute("teacher",teacher);
                                return "teacher/home";

                            }
                        }
                        else {
                            model.addAttribute("error", "账号或密码错误！请重新输入");
                            return "login";
                        }
                    }else {
                        model.addAttribute("error", "此账号被禁用，请联系管理员解决");
                        return "login";
                    }
                }
            }else {
                model.addAttribute("error", "账号或密码不可以为空！");
                return "login";
            }

        }catch (Exception e){
            model.addAttribute("error", "账号或密码错误！请重新输入");
            return "login";

        }
        model.addAttribute("error", "账号或密码错误！请重新输入");
        return "login";

    }

}
