package com.min.graduation.utils;

import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author zhangjiamin
 * @date 2020/12/16 15:02
 *
 * 此类将Wed Dec 16 22:37:13 CST 2020格式转换成yy--MM-dd
 */
@Service
public class ChangeFormat {
    public Date setFormat(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String stDate= sdf.format(date); //开始时间格式化成yyyy-MM-dd格式的时间字符串
        try {
            Date newStartDate =sdf.parse(stDate);
            java.sql.Date resultStDate = new java.sql.Date(newStartDate.getTime());
            return resultStDate;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
