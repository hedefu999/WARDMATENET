package com.wardmate.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MedicineMapper {
    List<String> getAllMedicineName();
    String getSimpleMedicineWikiByName(@Param("name") String name);
    String getMedicineWikiByName(@Param("name") String name);
}
