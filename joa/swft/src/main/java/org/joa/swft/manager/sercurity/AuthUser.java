package org.joa.swft.manager.sercurity;

import lombok.Data;
import org.joa.swft.pojo.entity.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * @author JiangTeJie
 * @title: AuthUser
 * @projectName manage
 * @description: Security认证用户实体信息
 * @date 2019/12/2920:34
 */

@Data
public class AuthUser implements UserDetails {

    /**
     * 权限角色集合
     */
    private Collection<? extends GrantedAuthority> authority;

    private User user;

    public AuthUser(User user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authority;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return user.getAccountNonExpired();
    }

    @Override
    public boolean isAccountNonLocked() {
        return user.getAccountNonLocked();
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return user.getCredentialsNonExpired();
    }

    @Override
    public boolean isEnabled() {
        return user.getEnabled();
    }
}
