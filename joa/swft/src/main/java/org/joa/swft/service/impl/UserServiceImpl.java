package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.UserMapper;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:22
 */

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;
}
