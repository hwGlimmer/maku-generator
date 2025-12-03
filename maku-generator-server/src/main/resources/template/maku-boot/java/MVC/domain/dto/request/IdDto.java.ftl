package ${package}.${moduleName}.domain.dto.request;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
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
@ApiModel(value = "${tableComment}-详情或者删除入参")
public class Req${ClassName}IdDto {

    @ApiModelProperty(value =  "主键")
    @NotNull(message = "id不能为空")
    private Long id;

}