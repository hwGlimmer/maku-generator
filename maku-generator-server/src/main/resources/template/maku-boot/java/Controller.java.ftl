package ${package}.${moduleName}.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import javax.validation.Valid;
import org.springframework.http.MediaType;
import ${package}.framework.base.api.ApiResult;
import ${package}.framework.base.page.PageInfo;
import ${package}.${moduleName}.convert.${ClassName}Convert;
import ${package}.${moduleName}.domain.entity.${ClassName}Entity;
import ${package}.${moduleName}.service.${ClassName}Service;
import ${package}.${moduleName}.domain.request.${ClassName}PageReq;
import ${package}.${moduleName}.domain.vo.${ClassName}VO;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* ${tableComment}
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@RestController
@RequestMapping("${moduleName}/${functionName}")
@Api(tags = "${tableComment!}", value = "${tableComment!}")
@AllArgsConstructor
public class ${ClassName}Controller {
    private final ${ClassName}Service ${className}Service;

    @PostMapping(value = "page", produces = MediaType.APPLICATION_JSON_VALUE)
    @ApiOperation(value = "${tableComment!}-分页查询")
    public ApiResult<PageInfo<${ClassName}VO>> page(@Valid @RequestBody ${ClassName}PageReq query){
        PageInfo<${ClassName}VO> page = ${className}Service.page(query);

        return ApiResult.ok(page);
    }

    @GetMapping(value ="{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ApiOperation(value = "${tableComment!}-详情")
    public ApiResult<${ClassName}VO> get(@ApiParam(value = "主键ID") @PathVariable("id") Long id){
        ${ClassName}Entity entity = ${className}Service.getById(id);

        return ApiResult.ok(${ClassName}Convert.INSTANCE.convert(entity));
    }

    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    @ApiOperation(value = "${tableComment!}-保存")
    public ApiResult<${ClassName}VO> save(@Valid @RequestBody ${ClassName}VO vo){
        ${ClassName}Entity entity =  ${className}Service.save(vo);

        return ApiResult.ok(${ClassName}Convert.INSTANCE.convert(entity));
    }

    @PutMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    @ApiOperation(value = "${tableComment!}-修改")
    public ApiResult<String> update(@RequestBody ${ClassName}VO vo){
        ${className}Service.update(vo);

        return ApiResult.ok();
    }

    @DeleteMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    @ApiOperation(value = "${tableComment!}-删除")
    public ApiResult<String> delete(@ApiParam(value = "主键ID列表") @RequestBody List<Long> idList){
        ${className}Service.delete(idList);

        return ApiResult.ok();
    }
}