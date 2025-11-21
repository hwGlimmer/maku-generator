package ${package}.${moduleName}.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import ${package}.framework.base.page.PageInfo;;
import ${package}.${moduleName}.convert.${ClassName}Convert;
import ${package}.${moduleName}.domain.entity.${ClassName}Entity;
import ${package}.${moduleName}.domain.request.${ClassName}PageReq;
import ${package}.${moduleName}.domain.vo.${ClassName}VO;
import ${package}.${moduleName}.dao.${ClassName}Mapper;
import ${package}.${moduleName}.service.${ClassName}Service;
import ${package}.${moduleName}.service.impl.BaseServiceImpl;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import  ${package}.framework.util.PageUtils;

import java.util.List;

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Service
@AllArgsConstructor
public class ${ClassName}ServiceImpl extends BaseServiceImpl<${ClassName}Mapper, ${ClassName}Entity> implements ${ClassName}Service {

    @Override
    public PageInfo<${ClassName}VO> page(${ClassName}PageReq query) {
        IPage<${ClassName}Entity> page = baseMapper.selectPage(getPage(query), getWrapper(query));

        List<${ClassName}VO> list = ${ClassName}Convert.INSTANCE.convertList(page.getRecords());

        // 分页对象-构建
        PageInfo<${ClassName}VO> pageInfo = PageUtils.build(
            Integer.valueOf((int) page.getCurrent()), Integer.valueOf((int) page.getSize()), list, page.getTotal()
            );

        return pageInfo;
    }

    private LambdaQueryWrapper<${ClassName}Entity> getWrapper(${ClassName}PageReq query){
        LambdaQueryWrapper<${ClassName}Entity> wrapper = Wrappers.lambdaQuery();
        <#list queryList as field>
            <#if field.queryFormType == 'date' || field.queryFormType == 'datetime'>
        wrapper.between(ArrayUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, ArrayUtils.isNotEmpty(query.get${field.attrName?cap_first}()) ? query.get${field.attrName?cap_first}()[0] : null, ArrayUtils.isNotEmpty(query.get${field.attrName?cap_first}()) ? query.get${field.attrName?cap_first}()[1] : null);
            <#elseif field.attrType == 'Integer' || field.attrType == 'Long' || field.attrType == 'Double' || field.attrType == 'BigDecimal'>
        wrapper.eq(query.get${field.attrName?cap_first}() != null, ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == '='>
        wrapper.eq(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == '!='>
        wrapper.ne(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == '>'>
        wrapper.gt(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == '>='>
        wrapper.ge(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == '<'>
        wrapper.lt(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == '<='>
        wrapper.le(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == 'like'>
        wrapper.like(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == 'left like'>
        wrapper.likeLeft(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            <#elseif field.queryType == 'right like'>
        wrapper.likeRight(StringUtils.isNotEmpty(query.get${field.attrName?cap_first}()), ${ClassName}Entity::get${field.attrName?cap_first}, query.get${field.attrName?cap_first}());
            </#if>
        </#list>
        return wrapper;
    }

    @Override
    public ${ClassName}Entity save(${ClassName}VO vo) {
        ${ClassName}Entity entity = ${ClassName}Convert.INSTANCE.convert(vo);

        baseMapper.insert(entity);

        return entity;
    }

    @Override
    public void update(${ClassName}VO vo) {
        ${ClassName}Entity entity = ${ClassName}Convert.INSTANCE.convert(vo);

        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

}