package com.javasm.crm.user.controller;

import com.javasm.crm.common.entity.TreeNodes;
import com.javasm.crm.common.utils.TreeNodesBuilder;
import com.javasm.crm.user.entity.Menulist;
import com.javasm.crm.user.service.MenulistService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuListHandler {
    @Resource
    private MenulistService menulistService;
    /**
     * 加载导航栏数据
     *
     * @return
     */
    @RequestMapping("/loadMenu")
    @ResponseBody
    public Object loadMenu() {
        List<Menulist> ms = menulistService.selectAll();
        List<TreeNodes> treeNodes = new ArrayList<>();

        for (Menulist m : ms) {
            boolean flag = m.getSpread() == 1;
            treeNodes.add(new TreeNodes(m.getMenuId(),m.getMenuName(),m.getMenuIcon(),m.getMenuUrl(),m.getMenuPid(),flag));
        }
        return TreeNodesBuilder.build(treeNodes,0);    }
}
