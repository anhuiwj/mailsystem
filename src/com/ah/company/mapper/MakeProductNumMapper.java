package com.ah.company.mapper;

import com.ah.company.pojo.MakeProductNum;

import java.util.List;
import java.util.Map;

public interface MakeProductNumMapper {
    /**
     * 查询配比产品列表
     * @param searchParam
     * @return
     */
    List<MakeProductNum> findAll(Map<String,Object> searchParam);

    int save(MakeProductNum makeProductNum);

    int update(MakeProductNum makeProductNum);
}