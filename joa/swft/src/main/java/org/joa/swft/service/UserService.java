package org.joa.swft.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.joa.swft.pojo.entity.User;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:21
 */
public interface UserService extends IService<User> {

    /**
     * 获取用户所有角色权限
     *
     * @param userId
     * @return
     */
    @Cacheable(cacheNames = "authority", key = "'user_id_'+#userId")
    String getUserAuthority(Integer userId);

    /**
     * 绑定用户和角色
     *
     * @param userId  用户id
     * @param roleIds 角色ids
     * @return
     */
    @CacheEvict(cacheNames = "authority", key = "'user_id_'+#userId")
    boolean bindUserAndRole(Integer userId, List<Integer> roleIds);
}
