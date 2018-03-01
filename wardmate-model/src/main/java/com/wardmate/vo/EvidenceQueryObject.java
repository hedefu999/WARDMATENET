package com.wardmate.vo;

import java.io.Serializable;
import java.util.List;

public class EvidenceQueryObject implements Serializable{
    //简单检索支持的检索字段
    private String allField;
    private String title;
    private String keywords;
    private String summary;
    //进一步筛选
    private List<String> types;
    private boolean timeASC = false;
    private Integer years = 0;
    private Integer pageNo = 1;
    private Integer offset;
    private Integer countOnePage = 9;

    public String getAllField() {
        return allField;
    }

    public void setAllField(String allField) {
        this.allField = allField;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public boolean isTimeASC() {
        return timeASC;
    }

    public void setTimeASC(boolean timeASC) {
        this.timeASC = timeASC;
    }

    public Integer getYears() {
        return years;
    }

    public void setYears(Integer years) {
        this.years = years;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getOffset() {
        return (this.pageNo - 1) * this.countOnePage;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getCountOnePage() {
        return countOnePage;
    }

    public void setCountOnePage(Integer countOnePage) {
        this.countOnePage = countOnePage;
    }

    @Override
    public String toString() {
        return "EvidenceQueryObject{" +
                "title='" + title + '\'' +
                ", keywords='" + keywords + '\'' +
                ", summary='" + summary + '\'' +
                ", type='" + types + '\'' +
                ", timeASC=" + timeASC +
                ", years=" + years +
                '}';
    }
}
