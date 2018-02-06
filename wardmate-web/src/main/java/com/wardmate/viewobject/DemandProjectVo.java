package com.wardmate.viewobject;

import java.util.List;

/**
 * Created by hedefu on 13/12/2017.
 */
public class DemandProjectVo {
    private int demandProjectAssnId;
    private String projectAddress;
    private Integer districtCode;//
    private String ownerName;//
    private Integer status;//
    private Integer newStatus;
    private Integer recommendStatus;//

    public DemandProjectVo(int demandProjectAssnId, String projectAddress, Integer districtCode, String ownerName, int status, int newStatus, Integer recommendStatus) {
        this.demandProjectAssnId = demandProjectAssnId;
        this.projectAddress = projectAddress;
        this.districtCode = districtCode;
        this.ownerName = ownerName;
        this.status = status;
        this.newStatus = newStatus;
        this.recommendStatus = recommendStatus;
    }

    public int getDemandProjectAssnId() {
        return demandProjectAssnId;
    }

    public void setDemandProjectAssnId(int demandProjectAssnId) {
        this.demandProjectAssnId = demandProjectAssnId;
    }

    public String getProjectAddress() {
        return projectAddress;
    }

    public void setProjectAddress(String projectAddress) {
        this.projectAddress = projectAddress;
    }

    public Integer getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(Integer districtCode) {
        this.districtCode = districtCode;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getNewStatus() {
        return newStatus;
    }

    public void setNewStatus(Integer newStatus) {
        this.newStatus = newStatus;
    }

    public Integer getRecommendStatus() {
        return recommendStatus;
    }

    public void setRecommendStatus(Integer recommendStatus) {
        this.recommendStatus = recommendStatus;
    }

    @Override
    public String toString() {
        return "Vo{" +
                "assnId=" + demandProjectAssnId +
                ", address='" + projectAddress + '\'' +
                ", districtCode=" + districtCode +
                ", ownerName='" + ownerName + '\'' +
                ", status=" + status +
                ", newStatus=" + newStatus +
                ", recommendStatus=" + recommendStatus +
                '}';
    }
}
