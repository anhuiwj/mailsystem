package com.ah.company.pojo;

import com.ah.manager.pojo.BaseEntity;

public class MakeProductNum extends BaseEntity{
    private String id;

    private String productName;//制作产品名称

    private Integer proNum;//制作产品数量

    private String formulaId;//配比公式id

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getProNum() {
        return proNum;
    }

    public void setProNum(Integer proNum) {
        this.proNum = proNum;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(String formulaId) {
        this.formulaId = formulaId;
    }
}