package com.ah.company.service;

import com.ah.company.pojo.MakeProductNum;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;

/**
 * Created by wangjie on 2017/3/17.
 */
public interface ProductService {
    void findAll(Pager pager);
    JsonResponseEntity save(MakeProductNum makeProductNum);
}
