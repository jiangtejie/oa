package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.RoleMapper;
import org.joa.swft.dao.UserRoleMapper;
import org.joa.swft.pojo.entity.Role;
import org.joa.swft.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author JiangTeJie
 * @since 2020/3/16 22:37
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteRoleById(Integer id) {
        Integer result = roleMapper.deleteById(id);
        userRoleMapper.deleteByRoleId(id);
        return null != result && result >= 1;
    }
}
