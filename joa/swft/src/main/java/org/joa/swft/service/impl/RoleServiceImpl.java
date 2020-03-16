package org.joa.swft.service.impl;

import org.joa.swft.dao.RoleMapper;
import org.joa.swft.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author JiangTeJie
 * @since 2020/3/16 22:37
 */
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
}
