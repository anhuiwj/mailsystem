package com.ah.company.pojo;

import com.ah.manager.pojo.BaseEntity;

public class RawMaterial extends BaseEntity{
    private String id;

    private String commonlyCalled; //俗称

    private String chinaName; //中文名

    private String englishName; //英文名

    private String chemicalFormula; //化学式

    private Integer inventory;//库存量

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCommonlyCalled() {
        return commonlyCalled;
    }

    public void setCommonlyCalled(String commonlyCalled) {
        this.commonlyCalled = commonlyCalled == null ? null : commonlyCalled.trim();
    }

    public String getChinaName() {
        return chinaName;
    }

    public void setChinaName(String chinaName) {
        this.chinaName = chinaName == null ? null : chinaName.trim();
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName == null ? null : englishName.trim();
    }

    public String getChemicalFormula() {
        return chemicalFormula;
    }

    public void setChemicalFormula(String chemicalFormula) {
        this.chemicalFormula = chemicalFormula == null ? null : chemicalFormula.trim();
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }
}