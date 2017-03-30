package com.ah.company.pojo;

import com.ah.manager.pojo.BaseEntity;

import java.util.Date;

public class MakeProductMaterial extends BaseEntity{
    private String id;

    private Integer materialNum;//使用原材料数量

    private String makeProductId;//制作产品id

    private String rawMaterialId;//原材料id

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getMaterialNum() {
        return materialNum;
    }

    public void setMaterialNum(Integer materialNum) {
        this.materialNum = materialNum;
    }

    public String getMakeProductId() {
        return makeProductId;
    }

    public void setMakeProductId(String makeProductId) {
        this.makeProductId = makeProductId == null ? null : makeProductId.trim();
    }

    public String getRawMaterialId() {
        return rawMaterialId;
    }

    public void setRawMaterialId(String rawMaterialId) {
        this.rawMaterialId = rawMaterialId == null ? null : rawMaterialId.trim();
    }
}