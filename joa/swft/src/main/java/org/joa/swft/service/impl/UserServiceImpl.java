package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.UserMapper;
import org.joa.swft.dao.UserPermMapper;
import org.joa.swft.dao.UserRoleMapper;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:22
 */

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private UserPermMapper userPermMapper;

    @Override
    public String getUserAuthority(Integer userId){
        List<String> roleStrList = userRoleMapper.selectRoleByUserId(userId);
        List<String> permList = userPermMapper.selectPermByUserId(userId);
        roleStrList.addAll(permList);
        return String.join(",",roleStrList);
    }

    @Override
    public boolean bindUserAndRole(Integer userId, List<Integer> roleId) {
        return userRoleMapper.batchInsertUserAndRole(userId, roleId) > 0 ? true : false;
    }
}
