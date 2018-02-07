package com.wardmate.vo;

import java.io.Serializable;

public class KnowledgeCardQueryConditions implements Serializable{
    private Integer pageIndex = 1;
    private String firstPhoneticLetter = "V";
    private String keyword;


    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public String getFirstPhoneticLetter() {
        return firstPhoneticLetter;
    }

    public void setFirstPhoneticLetter(String firstPhoneticLetter) {
        this.firstPhoneticLetter = firstPhoneticLetter;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "KnowledgeCardQueryConditions{" +
                "pageIndex=" + pageIndex +
                ", firstPhoneticLetter='" + firstPhoneticLetter + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
