package ${package}.${moduleName}.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import com.alibaba.excel.annotation.format.DateTimeFormat;
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
public class ${ClassName}ExcelDto  {
<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list fieldList as field>
    <#if field.fieldComment!?length gt 0>
    @ApiModelProperty(value = "${field.fieldComment}")
    <#if field.formRequired>
    @ExcelProperty("${field.fieldComment}*")
    <#else>
    @ExcelProperty("${field.fieldComment}")
    </#if>
        <#if field.fieldType == 'date'>
    @DateTimeFormat("yyyy-MM-dd")
        </#if>
        <#if field.fieldType == 'datetime'>
    @DateTimeFormat("yyyy-MM-dd HH:mm:ss")
        </#if>
    </#if>
    private ${field.attrType} ${field.attrName};

</#list>
<#------------  END 字段循环遍历  ---------->

}
