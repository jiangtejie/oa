package org.joa.swft.config;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.joa.swft.manager.sercurity.AuthUser;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

@Configuration
@EnableCaching
public class GuavaCacheConfig {

    public final static String USER_INFO_CACHE = "currentUser";

    /**
     * 用户角色信息缓存
     * @return
     */
    @Bean(name = "userInfoCache")
    public Cache<String, AuthUser> userInfoCache() {
        return CacheBuilder.newBuilder().expireAfterWrite(1L, TimeUnit.DAYS).build();
    }
}
