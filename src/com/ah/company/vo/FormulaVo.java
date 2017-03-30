package com.ah.company.vo;

import java.util.Date;

/**
 * Created by wangjie on 2017/3/18.
 */
public class FormulaVo {
    private String id;

    private String formulaName;//配比公式名称

    private String createBy;

    private String delFlag;

    private Date createDate;

    private String createDateString;//创建时间

    private String updateBy;

    private Date updateDate;

    private String commonlyCalled; //俗称

    private String chinaName; //中文名

    private String englishName; //英文名

    private String chemicalFormula; //化学式

    private Integer needNum;//需求量

    private String formulaMatarialId;//中间表id

    private String matarialId;//原材料id

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFormulaName() {
        return formulaName;
    }

    public void setFormulaName(String formulaName) {
        this.formulaName = formulaName;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getCommonlyCalled() {
        return commonlyCalled;
    }

    public void setCommonlyCalled(String commonlyCalled) {
        this.commonlyCalled = commonlyCalled;
    }

    public String getChinaName() {
        return chinaName;
    }

    public void setChinaName(String chinaName) {
        this.chinaName = chinaName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getChemicalFormula() {
        return chemicalFormula;
    }

    public void setChemicalFormula(String chemicalFormula) {
        this.chemicalFormula = chemicalFormula;
    }

    public Integer getNeedNum() {
        return needNum;
    }

    public void setNeedNum(Integer needNum) {
        this.needNum = needNum;
    }

    public String getFormulaMatarialId() {
        return formulaMatarialId;
    }

    public void setFormulaMatarialId(String formulaMatarialId) {
        this.formulaMatarialId = formulaMatarialId;
    }

    public String getCreateDateString() {
        return createDateString;
    }

    public void setCreateDateString(String createDateString) {
        this.createDateString = createDateString;
    }

    public String getMatarialId() {
        return matarialId;
    }

    public void setMatarialId(String matarialId) {
        this.matarialId = matarialId;
    }
}
