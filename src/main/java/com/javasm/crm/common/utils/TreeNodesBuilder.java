package com.javasm.crm.common.utils;

import com.javasm.crm.common.entity.TreeNodes;
import com.javasm.crm.user.service.MenulistService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

public class TreeNodesBuilder {

    @Resource
    private MenulistService menulistService;

    /**
     * 构建导航栏
     * @param treeNodes
     * @param topId
     * @return
     */
    public static List<TreeNodes> build(List<TreeNodes> treeNodes, Integer topId) {
        List<TreeNodes> nodes = new ArrayList<>();
        for (TreeNodes treeNode : treeNodes) {
            if (treeNode.getPid() == topId) {
                nodes.add(treeNode);
            }
            for (TreeNodes node : treeNodes) {
                if (node.getPid() == treeNode.getId()) {
                    treeNode.getChildren().add(node);
                }
            }
        }
        return nodes;
    }






}
