package com.ah.company.mapper;

import com.ah.company.pojo.Formula;
import com.ah.company.pojo.InMaterial;
import com.ah.company.vo.FormulaVo;
import com.ah.company.vo.InMaterialVo;

import java.util.List;
import java.util.Map;

public interface FormulaMapper {
    /**
     * 查询列表
     * @param searchParam
     * @return
     */
    List<InMaterialVo> findAll(Map<String,Object> searchParam);

    /**
     * 查询所需材料
     * @param
     * @return
     */
    List<InMaterialVo> findAll2(Map<String,Object> searchParam);


    /**
     * 查询
     * 配比公式所需原材料数量
     * @param id
     * @return
     */
    List<FormulaVo> findAllFormula(String id);

    /**
     * 查询所有配比公式
     * @return
     */
    List<FormulaVo> findFormulas();

    int update(InMaterial inMaterial);

    int save(Formula formula);
}