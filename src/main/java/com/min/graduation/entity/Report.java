package com.min.graduation.entity;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

/**
 * @author zhangjiamin
 * @date 2020/12/12 14:43
 */
@Data
public class Report implements Serializable {

    private Integer id;                 //编号
    private String s_id;                //学生学号
    private String s_name;              //学生姓名
    private String c_name;              //学生班级
    private String s_college;           //学院
    private Integer report_status;      //报告状态
    private Date commit_time;           //报告提交时间
    private String report_context;      //实习报告内容
    private String report_experience;   //实习心得
    private String t_name;              //教师姓名
    private String t_review_opinion;    //教师审核意见
    private Integer t_review_score;     //教师审核分数
    private Date t_review_time;         //教师审核提交时间
    private String company_person;      //企业负责人姓名
    private String emp_review_opinion;  //企业负责人审核意见
    private Integer emp_review_score;   //企业负责人审核分数
    private Date emp_review_time;       //企业负责人审核提交时间
    private String company_name;        //企业名称
    private LocalDate begin_time;       //实训开始时间
    private LocalDate end_time;         //实训结束时间
    private Long updatedOn;             //更新时长
    
}
