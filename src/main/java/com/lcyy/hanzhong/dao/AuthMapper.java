package com.lcyy.hanzhong.dao;

import com.lcyy.hanzhong.dao.base.BaseMapper;
import com.lcyy.hanzhong.entity.Auth;

import java.util.List;

/**
 * 定制授权Mapper接口
 *
 */
public interface AuthMapper extends BaseMapper<Auth>
{
    /**
     * 查询定制授权
     *
     * @param authId 定制授权ID
     * @return 定制授权
     */
    Auth selectAuthById(Long authId);

    /**
     * 查询定制授权列表
     *
     * @param auth 定制授权
     * @return 定制授权集合
     */
    List<Auth> selectAuthList(Auth auth);

    /**
     * 新增定制授权
     *
     * @param auth 定制授权
     * @return 结果
     */
    int insertAuth(Auth auth);

    /**
     * 修改定制授权
     *
     * @param auth 定制授权
     * @return 结果
     */
    int updateAuth(Auth auth);

    /**
     * 删除定制授权
     *
     * @param authId 定制授权ID
     * @return 结果
     */
    int deleteAuthById(Long authId);

    /**
     * 批量删除定制授权
     *
     * @param authIds 需要删除的数据ID
     * @return 结果
     */
    int deleteAuthByIds(Long[] authIds);
}
