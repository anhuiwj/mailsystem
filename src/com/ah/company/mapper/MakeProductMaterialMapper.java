package com.ah.company.mapper;

import com.ah.company.pojo.MakeProductMaterial;

import java.util.List;
import java.util.Map;

public interface MakeProductMaterialMapper {
    /**
     * 查询配比产品列表
     * @param searchParam
     * @return
     */
    List<MakeProductMaterial> findAll(Map<String,Object> searchParam);

    int save(MakeProductMaterial makeProductMaterial);

    int update(MakeProductMaterial makeProductMaterial);
}