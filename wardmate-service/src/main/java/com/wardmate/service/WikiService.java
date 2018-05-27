package com.wardmate.service;

import com.wardmate.mapper.DiseaseMapper;
import com.wardmate.mapper.MedicineMapper;
import com.wardmate.serviceInterface.IWikiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WikiService implements IWikiService {
    @Autowired
    private DiseaseMapper diseaseMapper;
    @Autowired
    private MedicineMapper medicineMapper;

    @Override
    public String getDiseaseInstruction(String name) {
        return diseaseMapper.getSimpleDiseaseWikiByName(name);
    }

    @Override
    public String getDiseaseWiki(String name) {
        return diseaseMapper.getDiseaseWikiByName(name);
    }

    @Override
    public String getMedicineInstruction(String name) {
        return medicineMapper.getSimpleMedicineWikiByName(name);
    }

    @Override
    public String getMedicineWiki(String name) {
        return medicineMapper.getMedicineWikiByName(name);
    }
}
