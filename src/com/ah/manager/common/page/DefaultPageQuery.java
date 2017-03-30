package com.ah.manager.common.page;

/**
 * mybatis分页查询接口默认实现
 * <p>
 * Created by Howe on 2016/3/29.
 */
public class DefaultPageQuery implements PageQuery {
    /**
     * 页码
     */
    private long pageNo;

    /**
     * 页面记录数
     */
    private int pageSize;

    /**
     * 总件数
     */
    private long count;

    /**
     * @param pageNo   当前页码
     * @param pageSize 每页记录数
     */
    public DefaultPageQuery(long pageNo, int pageSize) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    @Override
    public long getPageNo() {
        return this.pageNo;
    }

    @Override
    public int getPageSize() {
        return this.pageSize;
    }

    @Override
    public void setCount(long count) {
        this.count = count;
    }

    public void setPageNo(long pageNo) {
        this.pageNo = pageNo;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getCount() {
        return count;
    }
}
