package com.ah.company.pojo;

import com.ah.manager.pojo.BaseEntity;

public class FormulaMatarial extends BaseEntity {
    private String id;

    private String formulaId;

    private String rawMaterialId;

    private Integer needNum;

    public String getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(String formulaId) {
        this.formulaId = formulaId == null ? null : formulaId.trim();
    }

    public String getRawMaterialId() {
        return rawMaterialId;
    }

    public void setRawMaterialId(String rawMaterialId) {
        this.rawMaterialId = rawMaterialId == null ? null : rawMaterialId.trim();
    }

    public Integer getNeedNum() {
        return needNum;
    }

    public void setNeedNum(Integer needNum) {
        this.needNum = needNum;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}