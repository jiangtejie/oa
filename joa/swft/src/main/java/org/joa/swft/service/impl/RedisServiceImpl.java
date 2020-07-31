package org.joa.swft.service.impl;

import org.joa.swft.pojo.vo.WebSocketMessageVO;
import org.joa.swft.service.RedisService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
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
    public void setData(String remark, Object data, long timeout) {
        redisTemplate.opsForValue().set(remark, data, timeout, TimeUnit.SECONDS);
    }

    @Override
    public void setMsgList(String remark, Object data) {
        List<WebSocketMessageVO> webSocketMessageVOS = new ArrayList<>(8);
        webSocketMessageVOS.add((WebSocketMessageVO)data);
        redisTemplate.opsForList().leftPush(remark, webSocketMessageVOS);
    }

    @Override
    public void setMsgList(String remark, Object data, long timeout) {

    }

    @Override
    public Object getMsgList(String remark) {
        return redisTemplate.opsForList().rightPop(remark);
    }

    @Override
    public Long getOffMsgSize(String remark) {
        return redisTemplate.opsForList().size(remark);
    }

    @Override
    public Object getData(String remark) {
        return redisTemplate.opsForValue().get(remark);
    }
}
