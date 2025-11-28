package ${package}.${moduleName}.service;

import ${package}.framework.base.page.PageInfo;
import ${package}.${moduleName}.domain.dto.response.*;
import ${package}.${moduleName}.domain.dto.request.*;
import ${package}.${moduleName}.domain.po.*;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
public interface I${ClassName}Service extends IService<${ClassName}> {

    PageInfo<Rsp${ClassName}Dto> query(Req${ClassName}QueryDto req${ClassName}QueryDto);

    void add(Req${ClassName}AddDto req${ClassName}AddDto);

    Rsp${ClassName}Dto detail(Req${ClassName}IdDto req${ClassName}IdDto);

    void update(Req${ClassName}UpdateDto req${ClassName}UpdateDto);

    void delete(Req${ClassName}IdDto req${ClassName}IdDto);

}