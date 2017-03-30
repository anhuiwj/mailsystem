package com.ah.company.service;

import com.ah.company.pojo.Formula;
import com.ah.company.vo.FormulaVo;
import com.ah.manager.common.page.model.Pager;

import java.util.List;

/**
 * Created by wangjie on 2017/3/18.
 */
public interface ProductFormulaService {
    void findAll(Pager pager);

    void findAll2(Pager pager);

    void save(Formula formula);

    void delete(String id);

    List<FormulaVo> findAll();
}
