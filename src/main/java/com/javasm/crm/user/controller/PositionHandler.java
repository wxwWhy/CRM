package com.javasm.crm.user.controller;

import com.javasm.crm.user.entity.Position;
import com.javasm.crm.user.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/position")
public class PositionHandler {
    @Autowired
    private PositionService positionService;

    /**
     * 查询全部职位信息
     * @return
     */
    @RequestMapping("/all")
    @ResponseBody
    public List<Position> getAll() {
        List<Position> positions = positionService.selectAll();
        return positions;
    }

}
