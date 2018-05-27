package com.wardmate.vo;

public class UserInfo4GroupChat {
    private Integer userId;
    private String nickName;
    private String avatarURL;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAvatarURL() {
        return avatarURL;
    }

    public void setAvatarURL(String avatarURL) {
        this.avatarURL = avatarURL;
    }

    @Override
    public String toString() {
        return "UserInfo4GroupChat{" +
                "userId=" + userId +
                ", nickName='" + nickName + '\'' +
                ", avatarURL='" + avatarURL + '\'' +
                '}';
    }
}
