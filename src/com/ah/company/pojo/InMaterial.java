package com.ah.company.pojo;

import com.ah.manager.pojo.BaseEntity;

import java.util.Date;

public class InMaterial extends BaseEntity{
    private String id;

    private String rawMaterialId;

    private Float inNum;

    private String inUser;

    private Date inDate;

    public InMaterial(String rawMaterialId) {
        this.rawMaterialId = rawMaterialId;
    }

    public InMaterial() {
    }

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

    public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }

}