package com.javasm.crm.user.entity;

public class User {
    /**
     * 用户id
     */
    private Integer uid;

    /**
     * 用户姓名【中文】
     */
    private String uname;

    /**
     * 密码
     */
    private String password;

    /**
     * 性别
     */
    private Integer age;

    /**
     * 用户状态 1有效0无效
     */
    private Integer userStatus;

    /**
     * 用户登录名
     */
    private String loginName;

    /**
     * 归属部门
     */
    private Integer deptId;

    /**
     * 用户职务
     */
    private Integer positionId;

    /**
     * 用户角色
     */
    private Integer roleId;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 访问IP段
     */
    private String ipAddress;

    /**
     * 创建时间
     */
    private String creatime;

    /**
     * 创建人
     */
    private String creatName;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 部门
     */
    private Department department;

    /**
     * 职务
     */
    private Position position;

    /**
     * 角色
     */
    private Role role;

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public User(Integer uid, String uname, String password, Integer age, Integer userStatus, String loginName, Integer deptId, Integer positionId, Integer roleId, String phone, String email, String ipAddress, String creatime, String creatName) {
        this.uid = uid;
        this.uname = uname;
        this.password = password;
        this.age = age;
        this.userStatus = userStatus;
        this.loginName = loginName;
        this.deptId = deptId;
        this.positionId = positionId;
        this.roleId = roleId;
        this.phone = phone;
        this.email = email;
        this.ipAddress = ipAddress;
        this.creatime = creatime;
        this.creatName = creatName;
    }

    public User() {
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getCreatime() {
        return creatime;
    }

    public void setCreatime(String creatime) {
        this.creatime = creatime;
    }

    public String getCreatName() {
        return creatName;
    }

    public void setCreatName(String creatName) {
        this.creatName = creatName;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

}