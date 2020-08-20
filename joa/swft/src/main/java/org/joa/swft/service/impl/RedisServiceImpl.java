package org.joa.swft.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
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
 * @Description Redis服务
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
    public void setMsgList(String remark, WebSocketMessageVO data) {
        List<WebSocketMessageVO> webSocketMessageVOS = new ArrayList<>(8);
        webSocketMessageVOS.add(data);
        redisTemplate.opsForList().leftPush(remark, webSocketMessageVOS);
    }

    @Override
    public void setMsgListWithTime(String remark, WebSocketMessageVO data, long timeout) {

    }

    @Override
    public List<WebSocketMessageVO> getMsgList(String remark) {
        return JSON.parseArray(JSON.toJSONString(redisTemplate.opsForList().rightPop(remark)),WebSocketMessageVO.class);
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
