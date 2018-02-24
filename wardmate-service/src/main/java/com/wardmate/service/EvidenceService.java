package com.wardmate.service;

import com.wardmate.mapper.EvidenceMapper;
import com.wardmate.model.Evidence;
import com.wardmate.serviceInterface.IEvidenceService;
import com.wardmate.vo.EvidenceQueryObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvidenceService implements IEvidenceService {
    private Logger logger = LogManager.getLogger();
    @Autowired
    private EvidenceMapper evidenceMapper;

    @Override
    public List<Evidence> queryEvidence(EvidenceQueryObject queryObject) {
        return evidenceMapper.search(queryObject);
    }

    @Override
    public List<String> getEvidenceTypes(EvidenceQueryObject queryObject) {
        return evidenceMapper.getTypesWithSpecifiedConditions(queryObject);
    }
}
