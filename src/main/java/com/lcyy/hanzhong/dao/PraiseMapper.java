package com.lcyy.hanzhong.dao;

import com.lcyy.hanzhong.dao.base.BaseMapper;
import com.lcyy.hanzhong.entity.Praise;

import java.util.List;

/**
 * 点赞：Mapper接口
 *
 */
public interface PraiseMapper extends BaseMapper<Praise>
{
    /**
     * 查询点赞：
     *
     * @param praiseId 点赞：ID
     * @return 点赞：
     */
    Praise selectPraiseById(Integer praiseId);

    /**
     * 查询点赞：列表
     *
     * @param praise 点赞：
     * @return 点赞：集合
     */
    List<Praise> selectPraiseList(Praise praise);

    /**
     * 新增点赞：
     *
     * @param praise 点赞：
     * @return 结果
     */
    int insertPraise(Praise praise);

    /**
     * 修改点赞：
     *
     * @param praise 点赞：
     * @return 结果
     */
    int updatePraise(Praise praise);

    /**
     * 删除点赞：
     *
     * @param praiseId 点赞：ID
     * @return 结果
     */
    int deletePraiseById(Integer praiseId);

    /**
     * 批量删除点赞：
     *
     * @param praiseIds 需要删除的数据ID
     * @return 结果
     */
    int deletePraiseByIds(Integer[] praiseIds);
}
