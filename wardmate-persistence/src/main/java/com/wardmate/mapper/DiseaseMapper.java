package com.wardmate.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DiseaseMapper {
    List<String> getAllDiseaseName();
    String getSimpleDiseaseWikiByName(@Param("name") String name);
    String getDiseaseWikiByName(@Param("name") String name);
}
