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
@ApiModel(value = "${tableComment}-修改数据入参")
public class Req${ClassName}UpdateDto {
<#list fieldList as field>
    <#if field.fieldComment!?length gt 0>
    @ApiModelProperty(value =  "${field.fieldComment}")
    </#if>
    private ${field.attrType} ${field.attrName};

</#list>
}