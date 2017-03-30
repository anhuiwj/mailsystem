package com.ah.company.service;

import java.util.List;

import com.ah.company.pojo.InMaterial;
import com.ah.company.vo.InMaterialVo;
import com.ah.manager.common.page.model.Pager;

/**
 * Created by wangjie on 2017/3/18.
 */
public interface ProductInService {
    void findAll(Pager pager);

    void save(InMaterial inMaterial);
    
    /**
     * 查询所有库存信息 提示用户库存量
     * @return
     */
    List<InMaterialVo> findAll2();

}
