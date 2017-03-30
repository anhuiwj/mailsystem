package com.ah.manager.common.page;

import java.util.HashMap;

/**
 * Created by Howe on 2016/3/29.
 */
public class PageQueryMap extends HashMap<String, Object> {
    public PageQueryMap(PageQuery pq) {
        super();
        put("pageQuery", pq);
    }
}
