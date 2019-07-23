package com.javasm.crm.common.entity;

import java.util.ArrayList;

public class TreeNodes {

    /**
     * title : 后台首页
     * icon : icon-computer
     * href : page/main.html
     * spread : false
     * children : [{"title":"二级菜单1","icon":"&#xe631;","href":"","spread":false},{"title":"二级菜单2","icon":"&#xe631;","href":"","spread":false}]
     */

    private Integer id;
    private String title;
    private String icon;
    private String href;
    private Integer pid;
    private boolean spread;
    private ArrayList<TreeNodes> children =new ArrayList<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public ArrayList<TreeNodes> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<TreeNodes> children) {
        this.children = children;
    }

    public TreeNodes(Integer id, String title, String icon, String href, Integer pid, boolean spread) {
        this.id = id;
        this.title = title;
        this.icon = icon;
        this.href = href;
        this.pid = pid;
        this.spread = spread;
    }

    public TreeNodes() {
    }
}
