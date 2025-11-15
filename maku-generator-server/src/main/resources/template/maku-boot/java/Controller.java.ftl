package ${package}.${moduleName}.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
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

    @GetMapping("page")
    @ApiOperation(value = "分页")
    public ApiResult<PageInfo<${ClassName}VO>> page(${ClassName}PageReq query){
        PageInfo<${ClassName}VO> page = ${className}Service.page(query);

        return ApiResult.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation(value = "信息")
    public ApiResult<${ClassName}VO> get(@PathVariable("id") Long id){
        ${ClassName}Entity entity = ${className}Service.getById(id);

        return ApiResult.ok(${ClassName}Convert.INSTANCE.convert(entity));
    }

    @PostMapping
    @ApiOperation(value = "保存")
    public ApiResult<String> save(@RequestBody ${ClassName}VO vo){
        ${className}Service.save(vo);

        return ApiResult.ok();
    }

    @PutMapping
    @ApiOperation(value = "修改")
    public ApiResult<String> update(@RequestBody ${ClassName}VO vo){
        ${className}Service.update(vo);

        return ApiResult.ok();
    }

    @DeleteMapping
    @ApiOperation(value = "删除")
    public ApiResult<String> delete(@RequestBody List<Long> idList){
        ${className}Service.delete(idList);

        return ApiResult.ok();
    }
}