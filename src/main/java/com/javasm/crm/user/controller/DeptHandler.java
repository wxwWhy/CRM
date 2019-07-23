package com.javasm.crm.user.controller;

import com.github.pagehelper.PageInfo;
import com.javasm.crm.common.utils.Msg;
import com.javasm.crm.user.entity.Department;
import com.javasm.crm.user.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptHandler {
    @Autowired
    private DepartmentService departmentService;

    /**
     * 进入页面查出全部部门信息
     *
     * @return
     */
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Department> getDeptAll() {
        List<Department> departments = departmentService.selectAll();
        return departments;
    }

    /**
     * 进入页面查出部门信息(分页)
     *
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Msg getDeptList(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pageSize) {
        PageInfo<Department> departmentPageInfo = departmentService.selectAllwithPage(page, pageSize);
        return Msg.success().add("pageInfo", departmentPageInfo);
    }
}
