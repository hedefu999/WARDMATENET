package com.wardmate.vo;

public class EvidenceQueryObject {
    //简单检索支持的检索字段
    private String title;
    private String keywords;
    private String summary;
    //进一步筛选
    private String type;
    //private String author;
    //private String source;
    private boolean timeASC = false;
    private Integer years;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
}
