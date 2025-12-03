package ${package}.${moduleName}.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import ${package}.${moduleName}.domain.po.${ClassName};
import ${package}.${moduleName}.domain.dto.request.*;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;
/**
* ${tableComment}
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Mapper
public interface ${ClassName}Mapper extends BaseMapper<${ClassName}> {
    /**
	 * 根据条件查询分页列表
	 *
	 * @param params
	 * @return
	 */
    List<${ClassName}> selectPageListByCondition(IPage<${ClassName}> page, @Param("params")Map<String, Object> params);

	/**
	* 根据条件查询列表
	*
	* @param params
	* @return
	*/
	List<${ClassName}> selectListByCondition(@Param("params")${ClassName} params);
}