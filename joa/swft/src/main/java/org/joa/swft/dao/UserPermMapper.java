package org.joa.swft.dao;

import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/3/26 12:43
 */
public interface UserPermMapper {

    /**
     * 查询用户所有的权限
     * @param userId
     * @return
     */
    List<String> selectPermByUserId(Integer userId);
}
