package com.ah.company.mapper;

import com.ah.company.pojo.InMaterial;
import com.ah.company.vo.InMaterialVo;

import java.util.List;
import java.util.Map;

public interface InMaterialMapper {

    /**
     * 查询列表
     * @param searchParam
     * @return
     */
    List<InMaterialVo> findAll(Map<String,Object> searchParam);

    int save(InMaterial inMaterial);

    int update(InMaterial inMaterial);

    InMaterial selectOne(InMaterial inMaterial);

    InMaterial selectById(String id);

    //更新最新的库存信息
    int inmaterial(InMaterial inMaterial);
    
    /**
     * 查询所有库存信息
     * @return
     */
    List<InMaterialVo> findAll2();

}