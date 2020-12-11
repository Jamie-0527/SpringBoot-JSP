package com.min.graduation.controller;

import com.min.graduation.entity.Company;
import com.min.graduation.entity.Student;
import com.min.graduation.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author zhangjiamin
 * @date 2020/12/11 18:00
 */
@Controller
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    //查询公司信息
    @RequestMapping("companyPersonInformation")
    public String companyPersonInformation(Model model, HttpSession session) {

        String userName = (String) session.getAttribute("userName");
        if (userName != null && userName != ""){
            Company company = companyService.personInformation(userName);
            model.addAttribute("company",company);

            return "company/companyInformation";

        }
        model.addAttribute("error","身份信息过期，请重新登录！");
        return "login";
    }
}
