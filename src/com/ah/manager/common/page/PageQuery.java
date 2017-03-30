package com.ah.manager.common.page;

/**
 * mybatis分页查询接口
 * <p>
 * Created by Howe on 2016/3/29.
 */
public interface PageQuery {
    /**
     * 获取当前页码
     *
     * @return 当前页码
     */
    long getPageNo();

    /**
     * 获取每页记录数
     *
     * @return 每页记录数
     */
    int getPageSize();

    /**
     * 设置总件数
     *
     * @param count 总件数
     */
    void setCount(long count);
}


