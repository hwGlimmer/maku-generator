package ${package}.${moduleName}.domain.dto.request;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import ${package}.framework.base.domain.dto.ReqPageQueryDto;;
import org.springframework.format.annotation.DateTimeFormat;

<#list importList as i>
import ${i!};
</#list>

/**
* ${tableComment}查询
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "${tableComment}查询入参")
public class Req${ClassName}QueryDto extends ReqPageQueryDto {
<#list queryList as field>
    <#if field.fieldComment!?length gt 0>
    @ApiModelProperty(value =  "${field.fieldComment}")
    </#if>
    <#if field.queryFormType == 'date'>
    @DateTimeFormat(pattern="yyyy-MM-dd")
    <#elseif field.queryFormType == 'datetime'>
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    </#if>
    private ${field.attrType}<#if field.queryFormType == 'date' || field.queryFormType == 'datetime'>[]</#if> ${field.attrName};

</#list>
}