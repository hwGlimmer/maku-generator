package net.maku.generator.service;

import net.maku.generator.vo.PreviewVO;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.ZipOutputStream;

/**
 * 代码生成
 *
 * @author 阿沐 babamu@126.com
 * <a href="https://maku.net">MAKU</a>
 */
public interface GeneratorService {

    void downloadCode(Long tableId, ZipOutputStream zip, Set<String> entryies);

    void generatorCode(Long tableId);

    List<PreviewVO> preview(Long tableId);
}
