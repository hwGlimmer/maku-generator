package ${package}.${moduleName}.domain.dto.response;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.io.Serializable;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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
@ApiModel(value = "Rsp${tableComment}Dto")
public class Rsp${ClassName}Dto implements Serializable {
	private static final long serialVersionUID = 1L;

<#list fieldList as field>
	<#if field.fieldComment!?length gt 0>
	@ApiModelProperty(value = "${field.fieldComment}")
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