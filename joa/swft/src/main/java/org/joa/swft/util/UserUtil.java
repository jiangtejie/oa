package org.joa.swft.util;

import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import org.joa.swft.manager.sercurity.AuthUser;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author JiangTeJie
 * @title: UserUtil
 * @projectName manage
 * @description: 用户工具类
 * @date 2019/12/2922:59
 */
public class UserUtil {

    /**
     * 获取当前用户
     * @return
     */
    public static AuthUser getCurrentUser(){
        Object object = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        //当前上下文不存在登陆用户
        if(!ObjectUtils.isEmpty(object) && (object instanceof AuthUser)){
            return (AuthUser)object;
        }
        return null;
    }
}
