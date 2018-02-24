package com.wardmate.vo;

public class EvidenceQueryObject {
    private String type;
    private String title;
    private String author;
    private String source;
    private String keywords;
    private String summary;
    private boolean timeASC = false;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
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

    public boolean isTimeASC() {
        return timeASC;
    }

    public void setTimeASC(boolean timeASC) {
        this.timeASC = timeASC;
    }

    @Override
    public String toString() {
        return "EvidenceQueryObject{" +
                "type='" + type + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", source='" + source + '\'' +
                ", keywords='" + keywords + '\'' +
                ", summary='" + summary + '\'' +
                ", timeASC=" + timeASC +
                '}';
    }
}
