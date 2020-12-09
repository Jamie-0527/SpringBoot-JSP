package com.min.graduation.controller;

import com.min.graduation.entity.Student;
import com.min.graduation.service.LoginService;
import com.min.graduation.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 此类为Student的表现层
 */

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private LoginService loginService;

    @RequestMapping("studentUpdate")
    public String studentUpdate(){
        return "student/update";
    }

//    //查询所有
//    @RequestMapping("studentFindAll")
//    public String findAll(Model model){
//        System.out.println("findAll已运行...");
//
//        List<Student> students = service.findAll();
//        model.addAttribute("list",students);
//
//        return "student/findAll";
//    }
//
//    //根据姓名模糊查询
//    @RequestMapping("studentFindByName")
//    public String findByName(Model model, HttpServletRequest request){
//        System.out.println("FindByName已运行...");
//
//        String name = request.getParameter("");
//        List<Student> students = service.findByName(name);
//        model.addAttribute("list",students);
//
//        return "student/findAll";
//    }
//
//    //根据学号查询信息
//    @RequestMapping("studentFindById")
//    public String findById(Model model, HttpServletRequest request){
//        System.out.println("FindById已运行...");
//
//        String id = request.getParameter("");
//        Student student = service.findById(id);
//        model.addAttribute("list",student);
//
//        return "student/findAll";
//    }
//
//    //根据学号查询信息
//    @RequestMapping("saveStudent")
//    public void saveStudent(Student student, HttpServletRequest request, HttpServletResponse response) throws IOException{
//        System.out.println("saveStudent已运行...");
//
//        service.addStudent(student);
//        /*重定向到查询页面，将存入的信息打印出来*/
//        response.sendRedirect(request.getContextPath() + "/studentFindAll");
//    }

    //查询个人信息
    @RequestMapping("studentPersonInformation")
    public String studentPersonInformation(Model model,String sid) {

        Student student = studentService.personInformation(sid);
        model.addAttribute("studentInfo",student);

        return "student/information";
    }



    //查询班级同学信息
    @RequestMapping("studentGradeInformation")
    public String studentGradeInformation(Model model,String cname){

        /*更新后查询班级信息并跳转*/
        List<Student> list = studentService.findGradeStudent(cname);

        model.addAttribute("listStudent",list);

        return "student/gradeInformation";
    }

    //查询实习公司信息
    @RequestMapping("studentCompanyInformation")
    public String studentCompanyInformation(Model model,String sName){

        /*更新后查询班级信息并跳转*/
        Student company = studentService.findCompany(sName);

        model.addAttribute("studentCompany",company);

        return "student/companyInformation";
    }
}
