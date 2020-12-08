package com.min.graduation.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 此类为公司封装类
 */

@Data
public class Company implements Serializable {

    private String company_id;          //公司id
    private String company_name;        //公司名称
    private String company_address;     //公司地址
    private String company_person_id;   //公司负责人ID
    private String company_person;      //公司负责人
    private String company_phone;       //联系方式

    public Company(String company_id, String company_name, String company_address, String company_person_id, String company_person, String company_phone) {
        this.company_id = company_id;
        this.company_name = company_name;
        this.company_address = company_address;
        this.company_person_id = company_person_id;
        this.company_person = company_person;
        this.company_phone = company_phone;
    }
}
