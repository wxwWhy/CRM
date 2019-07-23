package com.javasm.crm.permission.controller;

import com.github.pagehelper.PageInfo;
import com.javasm.crm.common.utils.Msg;
import com.javasm.crm.permission.entity.Operation;
import com.javasm.crm.permission.service.OperationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;

@RequestMapping("/operation")
@Controller
@RestController
public class OperationHandler {

    @Resource
    private OperationService operationService;

    /**
     * 修改操作权限
     * @param operation
     * @return
     */
    @RequestMapping(value = "/update/${operatioId}", method = RequestMethod.PUT)
    public Msg updateOperation(Operation operation) {
        int i = operationService.updateByPrimaryKeySelective(operation);
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 删除操作权限
     * @param operationId
     * @return
     */
    @RequestMapping(value = "/delete/${operationId}", method = RequestMethod.DELETE)
    public Msg deleteOperation(@PathVariable("operationId") String operationId) {
        ArrayList<Integer> operationIds = new ArrayList<>();
        int i = 0;
        if (operationId.contains("-")) {
            String[] operationIdArray = operationId.split("-");
            for (String s : operationIdArray) {
                operationIds.add(Integer.parseInt(s));
            }
            i = operationService.batchDeleteOperation(operationIds);
        } else {
            i = operationService.deleteByPrimaryKey(Integer.parseInt(operationId));
        }
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 新增操作权限
     * @param operation
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Msg addOperation(Operation operation) {
        int i = operationService.insertSelective(operation);
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 分页查询全部
     *
     * @param page     当前页
     * @param pageSize 每页几条数据
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Msg getAllOperation(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "2") int pageSize) {
        PageInfo<Operation> operationPageInfo = operationService.selectAllPermissionwithPage(page, pageSize);
        return Msg.success().add("pageInfo", operationPageInfo);
    }
}
