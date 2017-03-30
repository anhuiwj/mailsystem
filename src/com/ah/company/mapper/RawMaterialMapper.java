package com.ah.company.mapper;

import com.ah.company.pojo.RawMaterial;

import java.util.List;
import java.util.Map;

public interface RawMaterialMapper {
    List<RawMaterial> findAll(Map<String,Object> searchmap);

    int save(RawMaterial rawMaterial);

    int update(RawMaterial rawMaterial);

    RawMaterial get(String id);

    List<RawMaterial> findRawMaterial();

    int delete(String id);
}