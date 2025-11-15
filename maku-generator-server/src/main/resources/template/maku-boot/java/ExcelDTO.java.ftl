package ${package}.${moduleName}.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
<#list importList as i>
import ${i!};
</#list>
import com.alibaba.excel.annotation.ExcelProperty;

/**
*
* @author ${author}
* @since ${date}
*/
@Data
@ApiModel(value = "${tableComment}ExcelDTO")
public class ${ClassName}ExcelDTO  {
<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list fieldList as field>
    <#if field.fieldComment!?length gt 0>
    @ApiModelProperty(value = "${field.fieldComment}")
    </#if>
    @ExcelProperty("${field.fieldComment}")
    private ${field.attrType} ${field.attrName};

</#list>
<#------------  END 字段循环遍历  ---------->

}
