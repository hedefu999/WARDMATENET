package com.wardmate.serviceInterface;

import com.wardmate.model.Evidence;
import com.wardmate.vo.EvidenceQueryObject;

import java.util.List;

public interface IEvidenceService {
    List<Evidence> queryEvidence(EvidenceQueryObject queryObject);
    List<String> getEvidenceTypes(EvidenceQueryObject queryObject);
    Integer getTotalResultCount(EvidenceQueryObject queryObject);
    Integer getTotalPageCount(EvidenceQueryObject queryObject);
}
