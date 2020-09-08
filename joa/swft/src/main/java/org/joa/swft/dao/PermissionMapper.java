package org.joa.swft.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.joa.swft.pojo.entity.Permission;
import org.springframework.stereotype.Repository;

/**
 * @author JiangTeJie
 * @since 2020/3/16 22:34
 */
@Repository("permissionMapper")
public interface PermissionMapper extends BaseMapper<Permission> {
}
