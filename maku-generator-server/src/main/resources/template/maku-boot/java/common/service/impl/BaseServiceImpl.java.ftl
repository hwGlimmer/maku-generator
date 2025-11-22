package ${package}.common.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import ${package}.framework.base.domain.dto.ReqPageQueryDto;
import ${package}.common.service.BaseService;


/**
 * 基础服务类，所有Service都要继承
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
public class BaseServiceImpl<M extends BaseMapper<T>, T, Q extends ReqPageQueryDto> extends ServiceImpl<M, T> implements BaseService<T> {

        /**
        * 获取分页对象
        *
        * @param query 分页参数
        */
        protected IPage<T> getPage(Q query) {
            Page<T> page = new Page<>(query.getCurrent(), query.getSize());
            return page;
        }

        protected QueryWrapper<T> getWrapper(ReqPageQueryDto query) {
            QueryWrapper<T> wrapper = new QueryWrapper<>();
            return wrapper;
       }

}