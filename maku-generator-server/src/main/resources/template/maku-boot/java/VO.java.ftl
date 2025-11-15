package ${package}.${moduleName}.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.io.Serializable;
import ${package}.biz.constant.BizConstant;

<#list importList as i>
import ${i!};
</#list>

/**
* ${tableComment}
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Data
@ApiModel(value = "${tableComment}VO")
public class ${ClassName}VO implements Serializable {
	private static final long serialVersionUID = 1L;

<#list fieldList as field>
	<#if field.fieldComment!?length gt 0>
	@ApiModelProperty(value = "${field.fieldComment}")
	</#if>
	<#if field.fieldType == 'date'>
	@JsonFormat(pattern = BizConstant.DATE_PATTERN)
	</#if>
	<#if field.fieldType == 'datetime'>
	@JsonFormat(pattern = BizConstant.DATE_TIME_PATTERN)
	</#if>
	private ${field.attrType} ${field.attrName};

</#list>

}