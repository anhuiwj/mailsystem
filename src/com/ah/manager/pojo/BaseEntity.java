/**
 *
 */
package com.ah.manager.pojo;

import com.ah.manager.util.UserUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Yoda
 *         <p/>
 *         TODO
 */
public abstract class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private String delFlag;
    private String sourceId;
    private String createBy;
    private Date createDate;
    private String updateBy;
    private Date updateDate;
    private String createDateString;

    public BaseEntity() {
        this.delFlag = "0";
        this.updateDate = new Date();
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getSourceId() {
        return sourceId;
    }

    public void setSourceId(String sourceId) {
        this.sourceId = sourceId;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
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

    public String getCreateDateString() {
        return createDateString;
    }

    public void setCreateDateString(String createDateString) {
        this.createDateString = createDateString;
    }

}
