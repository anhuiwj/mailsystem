package com.ah.company.vo;

import com.ah.company.pojo.InMaterial;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wangjie on 2017/3/19.
 */
public class MsgVo {
    private Boolean ok;
    private String msg;

    private List<InMaterial> inMaterialList = new ArrayList<InMaterial>();

    public Boolean getOk() {
        return ok;
    }

    public void setOk(Boolean ok) {
        this.ok = ok;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<InMaterial> getInMaterialList() {
        return inMaterialList;
    }

    public void setInMaterialList(List<InMaterial> inMaterialList) {
        this.inMaterialList = inMaterialList;
    }
}
