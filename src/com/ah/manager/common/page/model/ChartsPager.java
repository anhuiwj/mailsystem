package com.ah.manager.common.page.model;

import java.util.List;
import java.util.Map;

/**
 * Created by stone on 15/12/16.
 */
public class ChartsPager {
    private int pageSize;                   //页面大小
    private int nowPage;                    //当前页数初始值1
    private int recordCount;                //总记录数
    private int pageCount;                  //总页数
    private String areaId;                 //区id
    private Map<String, Object> parameters; //列表参数
    private List datas;                     //结果集

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(int recordCount) {
        this.recordCount = recordCount;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public Map<String, Object> getParameters() {
        return parameters;
    }

    public void setParameters(Map<String, Object> parameters) {
        this.parameters = parameters;
    }

    public List getDatas() {
        return datas;
    }

    public void setDatas(List datas) {
        this.datas = datas;
    }
}
