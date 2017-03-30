package com.ah.manager.common.page;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import java.io.Serializable;
import java.util.Map;
import java.util.Properties;

/**
 * 数据库分页插件，只拦截查询语句.
 */
@Intercepts({@Signature(type = Executor.class, method = "query",
        args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class})})
public class PaginationInterceptor implements Interceptor, Serializable {
    Log log = LogFactory.getLog(this.getClass());

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];

        //拦截需要分页的SQL
        Object parameter = invocation.getArgs()[1];
        if (parameter instanceof Map && ((Map) parameter).containsKey("pageQuery")) {
            Object oPage = ((Map) parameter).get("pageQuery");
            if (oPage != null && oPage instanceof PageQuery) {
                PageQuery page = (PageQuery) oPage;
                BoundSql boundSql = mappedStatement.getBoundSql(parameter);
                Object parameterObject = boundSql.getParameterObject();

                //如果设置了分页对象，则进行分页
                if (page.getPageSize() != -1) {

                    if (StringUtils.isBlank(boundSql.getSql())) {
                        return null;
                    }
                    String originalSql = boundSql.getSql().trim();

                    //得到总记录数
                    page.setCount(SQLHelper.getCount(originalSql, null, mappedStatement, parameterObject, boundSql, log));

                    //分页查询 本地化对象 修改数据库注意修改实现
                    String pageSql = SQLHelper.generatePageSql(originalSql, page);
                    if (log.isDebugEnabled()) {
                        log.debug("PAGE SQL:" + pageSql);
                    }
                    BoundSql newBoundSql = new BoundSql(mappedStatement.getConfiguration(), pageSql, boundSql.getParameterMappings(), boundSql.getParameterObject());

                    MappedStatement newMs = copyFromMappedStatement(mappedStatement, new BoundSqlSqlSource(newBoundSql));

                    invocation.getArgs()[0] = newMs;

                }
            }
        }
        return invocation.proceed();
    }

    private MappedStatement copyFromMappedStatement(MappedStatement ms,
                                                    SqlSource newSqlSource) {
        MappedStatement.Builder builder = new MappedStatement.Builder(ms.getConfiguration(),
                ms.getId(), newSqlSource, ms.getSqlCommandType());
        builder.resource(ms.getResource());
        builder.fetchSize(ms.getFetchSize());
        builder.statementType(ms.getStatementType());
        builder.keyGenerator(ms.getKeyGenerator());
        if (ms.getKeyProperties() != null) {
            for (String keyProperty : ms.getKeyProperties()) {
                builder.keyProperty(keyProperty);
            }
        }
        builder.timeout(ms.getTimeout());
        builder.parameterMap(ms.getParameterMap());
        builder.resultMaps(ms.getResultMaps());
        builder.cache(ms.getCache());
        return builder.build();
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }

    public static class BoundSqlSqlSource implements SqlSource {
        BoundSql boundSql;

        public BoundSqlSqlSource(BoundSql boundSql) {
            this.boundSql = boundSql;
        }

        public BoundSql getBoundSql(Object parameterObject) {
            return boundSql;
        }
    }
}
