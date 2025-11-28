package ${package}.${moduleName}.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import ${package}.framework.base.page.PageInfo;
import ${package}.${moduleName}.domain.dto.response.*;
import ${package}.${moduleName}.domain.dto.request.*;
import ${package}.${moduleName}.domain.po.*;
import ${package}.${moduleName}.dao.${ClassName}Mapper;
import ${package}.${moduleName}.service.I${ClassName}Service;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import  ${package}.framework.util.PageUtils;
import com.dongbei.cms.framework.util.BeanCopyUtils;
import com.dongbei.cms.framework.util.CollectionCopyUtils;

import java.util.List;

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Service
@AllArgsConstructor
public class ${ClassName}ServiceImpl extends ServiceImpl<${ClassName}Mapper, ${ClassName}> implements I${ClassName}Service {

    @Override
    public PageInfo<Rsp${ClassName}Dto> query(Req${ClassName}QueryDto query) {
        Page<${ClassName}> page = new Page<>(query.getCurrent(), query.getSize());

        ${ClassName} ${className} = BeanCopyUtils.copyProperties(query, ${ClassName}::new);
        List<${ClassName}> ${className}List = baseMapper.selectPageListByCondition(page,${className});

        List<Rsp${ClassName}Dto> list  = CollectionCopyUtils.copy(${className}List, Rsp${ClassName}Dto::new);

        // 分页对象-构建
        PageInfo<Rsp${ClassName}Dto> pageInfo = PageUtils.build(
            Integer.valueOf((int) page.getCurrent()), Integer.valueOf((int) page.getSize()), list, page.getTotal()
            );

        return pageInfo;
    }

    @Override
    public void add(Req${ClassName}AddDto req${ClassName}AddDto) {

        // 属性拷贝
        ${ClassName} ${className} = BeanCopyUtils.copyProperties(req${ClassName}AddDto, ${ClassName}::new);

        baseMapper.insert(${className});

    }

    @Override
    public Rsp${ClassName}Dto detail(Req${ClassName}IdDto req${ClassName}IdDto) {
        ${ClassName}  ${className} = getById(req${ClassName}IdDto.getId());
        Rsp${ClassName}Dto rsp${ClassName}Dto = BeanCopyUtils.copyProperties(${className},  Rsp${ClassName}Dto::new);
        return rsp${ClassName}Dto;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Req${ClassName}UpdateDto req${ClassName}UpdateDto) {

        // 属性拷贝
        ${ClassName} ${className} = BeanCopyUtils.copyProperties(req${ClassName}UpdateDto, ${ClassName}::new);

        updateById(${className});
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Req${ClassName}IdDto req${ClassName}IdDto) {
        removeById(reqCmsVacancyPositionIdDto.getId());
    }

}