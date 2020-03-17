package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.PermissionMapper;
import org.joa.swft.pojo.entity.Permission;
import org.joa.swft.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author JiangTeJie
 * @since 2020/3/16 22:38
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;
}
