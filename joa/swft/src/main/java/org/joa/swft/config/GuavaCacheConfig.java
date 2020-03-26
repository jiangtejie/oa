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

}
