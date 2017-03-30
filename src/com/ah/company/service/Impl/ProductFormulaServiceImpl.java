package com.ah.company.service.Impl;

import com.ah.company.mapper.FormulaMapper;
import com.ah.company.mapper.FormulaMatarialMapper;
import com.ah.company.pojo.Formula;
import com.ah.company.pojo.FormulaMatarial;
import com.ah.company.service.ProductFormulaService;
import com.ah.company.vo.FormulaVo;
import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.util.IdGen;
import com.ah.manager.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * Created by wangjie on 2017/3/18.
 */
@Service
@Transactional
public class ProductFormulaServiceImpl implements ProductFormulaService {

    @Autowired
    private FormulaMapper formulaMapper;

    @Autowired
    private FormulaMatarialMapper formulaMatarialMapper;

    @Override
    public void findAll(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        pager.setExhibitDatas(formulaMapper.findAll(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

    @Override
    public void findAll2(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        pager.setExhibitDatas(formulaMapper.findAll2(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

    @Override
    @Transactional
    public void save(Formula formula) {
        if(StringUtils.isEmpty(formula.getId())){
            formula.setCreateDate(new Date());
            formula.setId(IdGen.uuid());
            formula.setCreateBy(UserUtils.getCurrentUser().getUsername());
            formulaMapper.save(formula);
        }
        for(FormulaMatarial formulaMatarial:formula.getFormulaMatarials()){
            formulaMatarial.setId(IdGen.uuid());
            formulaMatarial.setFormulaId(formula.getId());
            formulaMatarial.setCreateDate(new Date());
            formulaMatarialMapper.save(formulaMatarial);
        }

    }

    @Override
    public void delete(String id) {
        formulaMatarialMapper.delete(id);
    }

    @Override
    public List<FormulaVo> findAll() {
        return formulaMapper.findFormulas();
    }
}
