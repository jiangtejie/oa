package org.joa.swft.service.impl;

import org.joa.swft.dao.PermissionMapper;
import org.joa.swft.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author JiangTeJie
 * @since 2020/3/16 22:38
 */
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;
}
