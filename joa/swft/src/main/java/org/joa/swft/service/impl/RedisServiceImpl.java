package org.joa.swft.service.impl;

import org.joa.swft.service.RedisService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @Classname RedisServiceImpl
 * @Description TODO
 * @Date 2019/10/9 0009 10:48
 * @Author by jtj
 */

@Service
public class RedisServiceImpl implements RedisService {

    @Resource(name = "redisTemplate")
    private RedisTemplate redisTemplate;

    @Override
    public void setData(String remark, Object data) {
        redisTemplate.opsForValue().set(remark, data);
    }

    @Override
    public void setDataWithTime(String remark, Integer data, long timeout) {
        redisTemplate.opsForValue().set(remark, data, timeout, TimeUnit.SECONDS);
    }

    @Override
    public Object getData(String remark) {
        return redisTemplate.opsForValue().get(remark);
    }
}
