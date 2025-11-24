package net.maku.generator.config.template;

import cn.hutool.core.util.StrUtil;
import net.maku.generator.common.exception.ServerException;
import net.maku.generator.common.utils.JsonUtils;
import net.maku.generator.enums.DesignTypeEnum;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/**
 * 代码生成配置内容
 *
 * @author 阿沐 babamu@126.com
 * <a href="https://maku.net">MAKU</a>
 */
public class GeneratorConfig {
    private String template;
    private String configFileName;

    // 原有的构造函数（向后兼容）
    public GeneratorConfig(String template) {
        // 默认配置文件
        this(template, "config_mvc.json");
    }

    // 新增构造函数，支持指定配置文件
    public GeneratorConfig(String template, String configFileName) {
        this.template = template;
        this.configFileName = configFileName;
    }

    public String getTemplate() {
        return template;
    }

    // 根据架构模式创建配置实例的静态方法
    public static GeneratorConfig createByDesignPattern(String template, int designPattern) {
        String configFile;
        if (designPattern == DesignTypeEnum.MVC.ordinal()) {
            configFile = "config_mvc.json";
        } else if (designPattern == DesignTypeEnum.DDD.ordinal()) {
            configFile = "config_ddd.json";
        } else {
            throw new ServerException("不支持的架构模式类型: " + designPattern);
        }
        return new GeneratorConfig(template, configFile);
    }

    public GeneratorInfo getGeneratorConfig() {
        // 模板路径，如果不是以/结尾，则添加/
        if (!StrUtil.endWith(template, '/')) {
            template = template + "/";
        }

        // 模板配置文件
        InputStream isConfig = this.getClass().getResourceAsStream(template + configFileName);
        if (isConfig == null) {
            throw new ServerException("模板配置文件，" + configFileName + "不存在");
        }

        try {
            // 读取模板配置文件
            String configContent = StreamUtils.copyToString(isConfig, StandardCharsets.UTF_8);
            GeneratorInfo generator = JsonUtils.parseObject(configContent, GeneratorInfo.class);
            for (TemplateInfo templateInfo : generator.getTemplates()) {
                // 模板文件
                InputStream isTemplate = this.getClass().getResourceAsStream(template + templateInfo.getTemplateName());
                if (isTemplate == null) {
                    throw new ServerException("模板文件 " + templateInfo.getTemplateName() + " 不存在");
                }
                // 读取模板内容
                String templateContent = StreamUtils.copyToString(isTemplate, StandardCharsets.UTF_8);

                templateInfo.setTemplateContent(templateContent);
            }
            return generator;
        } catch (IOException e) {
            throw new ServerException("读取" + configFileName + "配置文件失败");
        }
    }
}
