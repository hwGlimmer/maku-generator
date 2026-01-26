<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${package}.${moduleName}.dao.${ClassName}Mapper">

    <resultMap type="${package}.${moduleName}.domain.po.${ClassName}" id="${className}Map">
        <#list fieldList as field>
        <result property="${field.attrName}" column="${field.fieldName}"/>
        </#list>
    </resultMap>

    <sql id="Base_Column_List">
    <#list fieldList as field>
        ${field.fieldName}<#if field_has_next>,</#if>
        </#list>
    </sql>

    <!-- 共用的查询条件片段 -->
    <sql id="queryConditions">
        <where>
            <#list fieldList as field>
                <if test="${r"params."}${field.attrName} != null<#if field.attrType == 'String'> and ${r"params."}${field.attrName} != ''</#if>">
                    AND ${field.fieldName} =  ${r"#{params."}${field.attrName}${r"}"}
                </if>
            </#list>
        </where>
    </sql>

    <!-- List query by condition -->
    <select id="selectPageListByCondition"  resultMap="${className}Map">
        SELECT
            <include refid="Base_Column_List"/>
        FROM ${tableName}
        <include refid="queryConditions"/>
    </select>

    <!-- List query by condition -->
    <select id="selectListByCondition" parameterType="${package}.${moduleName}.domain.po.${ClassName}" resultMap="${className}Map">
        SELECT
            <include refid="Base_Column_List"/>
        FROM ${tableName}
        <include refid="queryConditions"/>
    </select>

</mapper>