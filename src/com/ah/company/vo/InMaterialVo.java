package com.ah.company.vo;

import java.util.Date;

public class InMaterialVo {
    private String id;

    private String rawMaterialId;//原材料id

    private String rawMaterName;

    private Float inNum;

    private String inUser;

    private String inDateString;

    private String delFlag;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRawMaterialId() {
        return rawMaterialId;
    }

    public void setRawMaterialId(String rawMaterialId) {
        this.rawMaterialId = rawMaterialId == null ? null : rawMaterialId.trim();
    }

    public Float getInNum() {
        return inNum;
    }

    public void setInNum(Float inNum) {
        this.inNum = inNum;
    }

    public String getInUser() {
        return inUser;
    }

    public void setInUser(String inUser) {
        this.inUser = inUser == null ? null : inUser.trim();
    }

    public String getInDateString() {
        return inDateString;
    }

    public void setInDateString(String inDateString) {
        this.inDateString = inDateString;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
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
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRawMaterName() {
        return rawMaterName;
    }

    public void setRawMaterName(String rawMaterName) {
        this.rawMaterName = rawMaterName;
    }
}