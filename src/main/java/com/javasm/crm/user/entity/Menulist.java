package com.javasm.crm.user.entity;

import java.util.ArrayList;

public class Menulist {
    /**
     * 菜单id
     */
    private Integer menuId;

    /**
     * 菜单名
     */
    private String menuName;

    /**
     * 菜单父id
     */
    private Integer menuPid;

    /**
     * 菜单url
     */
    private String menuUrl;

    /**
     * 菜单图标
     */
    private String menuIcon;

    /**
     * 是否为父菜单1是父菜单0不是父菜单
     */
    private Integer parent;

    /**
     * 排列顺序
     */
    private Integer ordernum;

    /**
     * 是否默认展开菜单1是0不是
     */
    private Integer spread;

    private ArrayList<Menulist> children = new ArrayList<>();

    public ArrayList<Menulist> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<Menulist> children) {
        this.children = children;
    }

    public Menulist(Integer menuId, String menuName, Integer menuPid, String menuUrl, String menuIcon, Integer parent, Integer ordernum, Integer spread) {
        this.menuId = menuId;
        this.menuName = menuName;
        this.menuPid = menuPid;
        this.menuUrl = menuUrl;
        this.menuIcon = menuIcon;
        this.parent = parent;
        this.ordernum = ordernum;
        this.spread = spread;
    }

    public Menulist() {
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getMenuPid() {
        return menuPid;
    }

    public void setMenuPid(Integer menuPid) {
        this.menuPid = menuPid;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    public Integer getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(Integer ordernum) {
        this.ordernum = ordernum;
    }

    public Integer getSpread() {
        return spread;
    }

    public void setSpread(Integer spread) {
        this.spread = spread;
    }
}