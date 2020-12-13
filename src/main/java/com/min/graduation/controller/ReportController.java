package com.min.graduation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhangjiamin
 * @date 2020/12/12 21:21
 */
@Controller
public class ReportController {

    @RequestMapping("test")
    public void test01(){
        System.out.println("访问了");
    }
}
