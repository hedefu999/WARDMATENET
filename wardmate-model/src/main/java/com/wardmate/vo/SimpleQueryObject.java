package com.wardmate.vo;

public class SimpleQueryObject {
    //简单检索前台传输两个数据
    private Integer fieldCode;
    private String searchTerm;

    public Integer getFieldCode() {
        return fieldCode;
    }

    public void setFieldCode(Integer fieldCode) {
        this.fieldCode = fieldCode;
    }

    public String getSearchTerm() {
        return searchTerm;
    }

    public void setSearchTerm(String searchTerm) {
        this.searchTerm = searchTerm;
    }
}
