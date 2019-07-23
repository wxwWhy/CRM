package com.javasm.crm.permission.entity;

public class Operation {
    /**
     * 可执行操作id
     */
    private Integer operationId;

    /**
     * 可执行操作名称
     */
    private String operationName;

    public Integer getOperationId() {
        return operationId;
    }

    public void setOperationId(Integer operationId) {
        this.operationId = operationId;
    }

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName;
    }
}