package com.min.graduation;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
@MapperScan("com.min.graduation.dao")
@Slf4j
public class GraduationMain {
    public static void main(String[] args) {
        ConfigurableApplicationContext run = SpringApplication.run(GraduationMain.class, args);
//        String[] beanNames = run.getBeanDefinitionNames();
//        //String[] beanNames = ctx.getBeanNamesForAnnotation(RestController.class);//所有添加该注解的bean
//        log.info("bean总数:{}", run.getBeanDefinitionCount());
//        int i = 0;
//        for (String str : beanNames) {
//            log.info("{},beanName:{}", ++i, str);
//        }

    }
}
