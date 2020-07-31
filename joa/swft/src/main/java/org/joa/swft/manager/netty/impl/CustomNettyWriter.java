package org.joa.swft.manager.netty.impl;

import com.alibaba.fastjson.JSONObject;
import io.netty.channel.Channel;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import lombok.extern.slf4j.Slf4j;
import org.joa.swft.manager.netty.NettyWriter;
import org.joa.swft.pojo.vo.WebSocketMessageVO;
import org.joa.swft.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author jtj
 */
@Slf4j
@Service
public class CustomNettyWriter implements NettyWriter {

    @Autowired
    private RedisService redisService;

    @Override
    public Boolean send(Integer userId, String msg, NettySendType sendType) {

        Channel channel;

        if (sendType.equals(NettySendType.WEBSOCKET_TYPE)) {
            channel = socketChannelHandlerContexts.get(userId);
        } else if (sendType.equals(NettySendType.TCP_TYPE)) {
            channel = tcpChannelHandlerContexts.get(userId);
        } else {
            return false;
        }

        //当前用户不在线, 缓存信息
        if (channel == null) {
            JSONObject data = new JSONObject();
            data.put("content","你好帅");
            redisService.setMsgList(userId.toString(), WebSocketMessageVO.builder().type("ws").data(data).build());
        } else {
            channel.writeAndFlush(new TextWebSocketFrame(msg));
        }
        return true;
    }

    @Override
    public List<WebSocketMessageVO> getOffMsgByUserId(Integer userId) {

        return null;
    }
}
