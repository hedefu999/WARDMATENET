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

    @Override
    public Integer getTotalResultCount(EvidenceQueryObject queryObject) {
        return evidenceMapper.getResultsCount(queryObject);
    }

    @Override
    public Integer getTotalPageCount(EvidenceQueryObject queryObject) {
        Integer totalItemsCount = evidenceMapper.getResultsCount(queryObject);
        //相比使用函数更巧妙 (int)Math.floor(totalItemsCount / queryObject.getCountOnePage());
        Integer totalPageCount = (totalItemsCount - 1)/queryObject.getCountOnePage() + 1;
        return totalPageCount;
    }
}
