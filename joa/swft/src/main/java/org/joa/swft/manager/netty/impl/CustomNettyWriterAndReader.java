package org.joa.swft.manager.netty.impl;

import com.alibaba.fastjson.JSONObject;
import io.netty.channel.Channel;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import lombok.extern.slf4j.Slf4j;
import org.joa.swft.manager.netty.NettyMessageManager;
import org.joa.swft.pojo.vo.WebSocketMessageVO;
import org.joa.swft.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: JTJ
 * @Date: 2020/08/19 上午 09:02
 * @Description: Netty读写消息工具
 */
@Slf4j
@Service
public class CustomNettyWriterAndReader extends NettyMessageManager {

    @Autowired
    private RedisService redisService;

    @Override
    public Boolean send(WebSocketMessageVO webSocketMessageVO) {
        Integer userId = webSocketMessageVO.getAcceptUserId();
        Channel channel = socketChannelHandlerContexts.get(userId);
        if (channel == null) {
            redisService.setMsgList(userId.toString(), webSocketMessageVO);
        } else {
            channel.writeAndFlush(new TextWebSocketFrame(JSONObject.toJSONString(webSocketMessageVO)));
        }
        return true;
    }

    @Override
    public List<WebSocketMessageVO> readInCache(Integer userId) {
        redisService.getMsgList(userId.toString());
        return null;
    }
}
