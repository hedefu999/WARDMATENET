package com.wardmate.vo;

import java.io.Serializable;

public class FeedbackMessage implements Serializable{
    private String title;
    private String content;
    private String targetURL;

    public FeedbackMessage() {
    }

    public FeedbackMessage(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public FeedbackMessage(String title, String content, String targetURL) {
        this.title = title;
        this.content = content;
        this.targetURL = targetURL;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTargetURL() {
        return targetURL;
    }

    public void setTargetURL(String targetURL) {
        this.targetURL = targetURL;
    }
}
