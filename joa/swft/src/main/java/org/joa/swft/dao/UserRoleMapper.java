package org.joa.swft.dao;

import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/3/26 10:59
 */
public interface UserRoleMapper {

    /**
     * 根据用户id查询角色信息
     * @param userId
     * @return
     */
    List<String> selectRoleByUserId(int userId);

    /**
     * 批量插入用户和角色信息
     * @param userId 用户id
     * @param roleIds  角色id集合
     * @return
     */
    int batchInsertUserAndRole(int userId, List<Integer> roleIds);

    /**
     * 根据角色id删除用户与角色的绑定记录
     * @param id
     * @return
     */
    int deleteByRoleId(Integer id);
}
