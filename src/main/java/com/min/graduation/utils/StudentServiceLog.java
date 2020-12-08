package com.min.graduation.utils;

import org.aspectj.lang.JoinPoint;
import org.springframework.stereotype.Service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Date;

/**
 * 此类用来将用户操作写入日志文件
 */

@Service
public class StudentServiceLog {

    public void log(JoinPoint joinPoint) {

        BufferedWriter bw = null;
        try {
            String information = new Date() + "执行了" + joinPoint.getSignature().getName() + "方法";
            // 指定写入文件的路径
            File file = new File("D:/IdeaProjects/graduation/src/main/webapp/WEB-INF/logs.txt");
            /* 先创建文件*/
            if (!file.exists()) {
                file.createNewFile();
                FileWriter fw = new FileWriter(file);
                bw = new BufferedWriter(fw);
                bw.write(information);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (bw != null)
                    bw.close();
            } catch (Exception ex) {
                System.out.println("Error in closing the BufferedWriter" + ex);
            }
        }
    }
}

