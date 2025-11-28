package ${package}.${moduleName}.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import javax.validation.Valid;
import org.springframework.http.MediaType;
import ${package}.framework.base.api.ApiResult;
import ${package}.framework.base.page.PageInfo;
import ${package}.${moduleName}.service.I${ClassName}Service;
import ${package}.${moduleName}.domain.dto.request.*;
import ${package}.${moduleName}.domain.dto.response.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private final I${ClassName}Service ${className}Service;

    @ApiOperation(
            value = "${tableComment!}-分页查询"
    )
    @PostMapping(value = "/query", produces = MediaType.APPLICATION_JSON_VALUE)
    public ApiResult<PageInfo<Rsp${ClassName}Dto>> query(
        @Valid 
        @RequestBody Req${ClassName}QueryDto req${ClassName}QueryDto
    ){

        PageInfo<Rsp${ClassName}Dto> page = ${className}Service.query(req${ClassName}QueryDto);

        return ApiResult.ok(page);
    }

    @ApiOperation(
            value = "${tableComment!}-详情"
    )
    @PostMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_VALUE)
    public ApiResult<Req${ClassName}IdDto> get(
            @Valid
            @RequestBody Req${ClassName}IdDto req${ClassName}IdDto
    ){

        Rsp${ClassName}Dto rsp${ClassName}Dto = ${className}Service.detail(req${ClassName}IdDto);

        return ApiResult.ok(rsp${ClassName}Dto);
    }


    @ApiOperation(
            value = "${tableComment!}-保存"
    )
    @PostMapping(value = "/add", produces = MediaType.APPLICATION_JSON_VALUE)
    public ApiResult add(
                @Valid
                @RequestBody Req${ClassName}AddDto  req${ClassName}AddDto
    ){

        ${className}Service.add(req${ClassName}AddDto);

        return ApiResult.ok();
    }


    @ApiOperation(
            value = "${tableComment!}-修改"
    )
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    public ApiResult update(
            @Valid
            @RequestBody Req${ClassName}UpdateDto req${ClassName}UpdateDto
    ){

        ${className}Service.update(req${ClassName}UpdateDto);

        return ApiResult.ok();
    }

    @ApiOperation(
            value = "${tableComment!}-删除"
    )
    @PostMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_VALUE)
    public ApiResult delete(
            @Valid
            @RequestBody Req${ClassName}IdDto req${ClassName}IdDto
    ) {

        ${className}Service.delete(req${ClassName}IdDto);

        return ApiResult.ok();
    }
}