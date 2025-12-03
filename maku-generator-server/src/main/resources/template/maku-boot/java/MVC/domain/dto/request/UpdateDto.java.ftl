package ${package}.${moduleName}.domain.dto.request;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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
@ApiModel(value = "${tableComment}-修改数据入参")
public class Req${ClassName}UpdateDto {
<#list fieldList as field>
    <#if field.fieldComment!?length gt 0>
        <#if field.formRequired>
    @ApiModelProperty(value = "${field.fieldComment}", required = true)
        <#else>
    @ApiModelProperty(value = "${field.fieldComment}")
        </#if>
    <#else>
        <#if field.formRequired>
    @ApiModelProperty(required = true)
        </#if>
    </#if>
    <#if field.fieldType == 'date'>
    @JsonFormat(pattern = "yyyy-MM-dd")
    </#if>
    <#if field.fieldType == 'datetime'>
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    </#if>
    <#if field.formRequired?? && field.formRequired>
        <#if field.attrType == 'String'>
    @NotBlank(message = "${field.fieldComment}不能为空")
        <#else>
    @NotNull(message = "${field.fieldComment}不能为空")
        </#if>
    </#if>
    private ${field.attrType} ${field.attrName};

</#list>
}