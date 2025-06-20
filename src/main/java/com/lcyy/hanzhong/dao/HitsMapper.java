package com.lcyy.hanzhong.dao;

import com.lcyy.hanzhong.dao.base.BaseMapper;
import com.lcyy.hanzhong.entity.Hits;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 *
 */
public interface HitsMapper extends BaseMapper<Hits>
{
    /**
     * 查询【请填写功能名称】
     *
     * @param hitsId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    Hits selectHitsById(Integer hitsId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param hits 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    List<Hits> selectHitsList(Hits hits);

    /**
     * 新增【请填写功能名称】
     *
     * @param hits 【请填写功能名称】
     * @return 结果
     */
    int insertHits(Hits hits);

    /**
     * 修改【请填写功能名称】
     *
     * @param hits 【请填写功能名称】
     * @return 结果
     */
    int updateHits(Hits hits);

    /**
     * 删除【请填写功能名称】
     *
     * @param hitsId 【请填写功能名称】ID
     * @return 结果
     */
    int deleteHitsById(Integer hitsId);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param hitsIds 需要删除的数据ID
     * @return 结果
     */
    int deleteHitsByIds(Integer[] hitsIds);
}
