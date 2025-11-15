<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${package}.${moduleName}.dao.${ClassName}Mapper">

    <resultMap type="${package}.${moduleName}.domain.entity.${ClassName}Entity" id="${className}Map">
        <#list fieldList as field>
        <result property="${field.attrName}" column="${field.fieldName}"/>
        </#list>
    </resultMap>

    <sql id="Base_Column_List">
    <#list fieldList as field>
        ${field.fieldName}<#if field_has_next>,</#if>
        </#list>
    </sql>

    <!-- List query by condition -->
    <select id="selectListByCondition" parameterType="${package}.${moduleName}.domain.entity.${ClassName}Entity" resultMap="${className}Map">
        SELECT
            <include refid="Base_Column_List"/>
        FROM ${tableName}
        <where>
            <#list fieldList as field>
            <if test="${field.attrName} != null<#if field.attrType == 'String'> and ${field.attrName} != ''</#if>">
                AND ${field.fieldName} = #${field.attrName}}
            </if>
            </#list>
        </where>
    </select>

</mapper>