package com.wardmate.mapper;

import com.wardmate.model.Evidence;
import com.wardmate.vo.EvidenceQueryObject;

import java.util.List;

public interface EvidenceMapper {
    List<Evidence> search(EvidenceQueryObject queryObject);
    List<String> getTypesWithSpecifiedConditions(EvidenceQueryObject queryObject);
    Integer getResultsCount(EvidenceQueryObject queryObject);
}
