package com.ah.company.service.Impl;

import com.ah.company.mapper.RawMaterialMapper;
import com.ah.company.pojo.RawMaterial;
import com.ah.company.service.RawmaterialService;
import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.util.IdGen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by wangjie on 2017/3/17.
 */
@Service
@Transactional
public class RawmaterialServiceImpl implements RawmaterialService {
    @Autowired
    private RawMaterialMapper rawMaterialMapper;

    @Override
    public void findAll(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        pager.setExhibitDatas(rawMaterialMapper.findAll(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

    @Override
    public void save(RawMaterial rawMaterial) {
        if(StringUtils.isEmpty(rawMaterial.getId())){
            rawMaterial.setId(IdGen.uuid());
            rawMaterialMapper.save(rawMaterial);
        }else {
            rawMaterialMapper.update(rawMaterial);
        }

    }

    @Override
    public void delete(String id) {
        rawMaterialMapper.delete(id);
    }

    @Override
    public RawMaterial get(String id) {
        RawMaterial rawMaterial = new RawMaterial();
        if(!StringUtils.isEmpty(id)){
            rawMaterial = rawMaterialMapper.get(id);
        }
        return rawMaterial;
    }

    @Override
    public List<RawMaterial> findAll() {
        return rawMaterialMapper.findRawMaterial();
    }
}
