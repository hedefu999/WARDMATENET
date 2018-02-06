package com.wardmate.enumration;

public enum Gender {
    FEMALE("女",0),MALE("男",1);//maybe someone not agree with this classification
    private String genderName;
    private Integer index;

    Gender(String genderName, Integer index) {
        this.genderName = genderName;
        this.index = index;
    }

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }
}
