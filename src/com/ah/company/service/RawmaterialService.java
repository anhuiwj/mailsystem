package com.ah.company.service;

import com.ah.company.pojo.RawMaterial;
import com.ah.manager.common.page.model.Pager;

import java.util.List;

/**
 * Created by wangjie on 2017/3/17.
 */
public interface RawmaterialService {
    void findAll(Pager pager);
    void save(RawMaterial rawMaterial);
    void delete(String id);
    RawMaterial get(String id);
    List<RawMaterial> findAll();
}
