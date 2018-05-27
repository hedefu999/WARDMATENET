package com.wardmate.model;

import java.io.Serializable;

public class InstantMessage implements Serializable{
    private Integer id;
    private Integer fromId;
    private String fromName;
    private String avatar;
    private Integer toId;
    private String message;
    private String type;
    private String dateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFromId() {
        return fromId;
    }

    public void setFromId(Integer fromId) {
        this.fromId = fromId;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getToId() {
        return toId;
    }

    public void setToId(Integer toId) {
        this.toId = toId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    @Override
    public String toString() {
        return "InstantMessage{" +
                "id=" + id +
                ", fromId=" + fromId +
                ", fromName='" + fromName + '\'' +
                ", avatar='" + avatar + '\'' +
                ", toId=" + toId +
                ", message='" + message + '\'' +
                ", type='" + type + '\'' +
                ", dateTime='" + dateTime + '\'' +
                '}';
    }
}
