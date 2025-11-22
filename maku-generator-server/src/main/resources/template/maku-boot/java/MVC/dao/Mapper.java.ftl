package ${package}.${moduleName}.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import ${package}.${moduleName}.domain.entity.${ClassName}Entity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
* ${tableComment}
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Mapper
public interface ${ClassName}Mapper extends BaseMapper<${ClassName}Entity> {
    /**
	 * 根据条件查询列表
	 *
	 * @param entity
	 * @return
	 */
    List<${ClassName}Entity> selectListByCondition(@Param("entity") ${ClassName}Entity entity);

}