package com.javasm.crm.user.controller;

import com.javasm.crm.user.service.DepartmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-config.xml"})
public class DeptHandlerTest {
    @Autowired
    private DepartmentService departmentService;

    @Test
    public void getDeptAll() {
        departmentService.selectAll();
    }
}