package com.wardmate.vo;

import com.wardmate.model.Evidence;

import java.util.List;

public class EvidenceQueryResult {
    private Integer totalResultCount;
    private List<String> evidenceTypes;
    private List<Evidence> evidences;

    public Integer getTotalResultCount() {
        return totalResultCount;
    }

    public void setTotalResultCount(Integer totalResultCount) {
        this.totalResultCount = totalResultCount;
    }

    public List<String> getEvidenceTypes() {
        return evidenceTypes;
    }

    public void setEvidenceTypes(List<String> evidenceTypes) {
        this.evidenceTypes = evidenceTypes;
    }

    public List<Evidence> getEvidences() {
        return evidences;
    }

    public void setEvidences(List<Evidence> evidences) {
        this.evidences = evidences;
    }
}
