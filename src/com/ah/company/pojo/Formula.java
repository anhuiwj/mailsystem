package com.ah.company.pojo;

import com.ah.manager.pojo.BaseEntity;

import java.util.ArrayList;
import java.util.List;

public class Formula extends BaseEntity{
    private String id;

    private String formulaName;

    private String createBy;


    private List<FormulaMatarial> formulaMatarials = new ArrayList<FormulaMatarial>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFormulaName() {
        return formulaName;
    }

    public void setFormulaName(String formulaName) {
        this.formulaName = formulaName == null ? null : formulaName.trim();
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }


    public List<FormulaMatarial> getFormulaMatarials() {
        return formulaMatarials;
    }

    public void setFormulaMatarials(List<FormulaMatarial> formulaMatarials) {
        this.formulaMatarials = formulaMatarials;
    }
}