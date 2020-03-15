package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.cache.Cache;
import lombok.extern.slf4j.Slf4j;
import org.joa.swft.config.GuavaCacheConfig;
import org.joa.swft.dao.UserMapper;
import org.joa.swft.manager.sercurity.AuthUser;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.service.CustomUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author JiangTeJie
 * @title: CustomUserDetailServiceImpl
 * @projectName manage
 * @description: 自定义Security认证对象
 * @date 2019/12/2915:58
 */
@Slf4j
@Service
public class CustomUserDetailServiceImpl extends ServiceImpl<UserMapper, User> implements CustomUserDetailService {

    @Autowired
    private UserMapper usersMapper;

    @Resource(name = "userInfoCache")
    private Cache<String, AuthUser> userInfoCache;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>(new User(s));
        if(log.isDebugEnabled()){
            log.debug("查询用户({})",s);
        }
        User user = usersMapper.selectOne(userQueryWrapper);
        if(ObjectUtils.isEmpty(user)){
            throw new UsernameNotFoundException("用户不存在");
        }
        AuthUser authUser = new AuthUser(user);
        //暂时写死
        authUser.setIsAccountNonExpired(true);
        authUser.setIsCredentialsNonExpired(true);
        authUser.setIsAccountNonLocked(true);
        authUser.setIsEnabled(true);

        //设置权限 角色
        String authoritiesStr = "ROLE_ADMIN";
        List<GrantedAuthority> authorities = new ArrayList<>(8);
        authorities.addAll(AuthorityUtils.commaSeparatedStringToAuthorityList(authoritiesStr));
        authUser.setAuthority(authorities);
        //缓存用户信息
        userInfoCache.put(GuavaCacheConfig.USER_INFO_CACHE,authUser);
        return authUser;
    }
}
