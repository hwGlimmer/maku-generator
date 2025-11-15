package ${package}.${moduleName}.service;

import ${package}.framework.base.page.PageInfo;
import ${package}.${moduleName}.service.BaseService;
import ${package}.${moduleName}.domain.vo.${ClassName}VO;
import ${package}.${moduleName}.domain.request.${ClassName}PageReq;
import ${package}.${moduleName}.domain.entity.${ClassName}Entity;

import java.util.List;

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
public interface ${ClassName}Service extends BaseService<${ClassName}Entity> {

    PageInfo<${ClassName}VO> page(${ClassName}PageReq query);

    void save(${ClassName}VO vo);

    void update(${ClassName}VO vo);

    void delete(List<Long> idList);
}