package org.joa.swft.manager.netty;

import com.alibaba.fastjson.JSONObject;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.websocketx.BinaryWebSocketFrame;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import lombok.extern.slf4j.Slf4j;
import org.joa.swft.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author jtj
 * Sharable 表示一个ChannelHandler可以被多个Channel安全地共享
 */
@Slf4j
@Component
@ChannelHandler.Sharable
public class WebSocketFrameHandler extends SimpleChannelInboundHandler<WebSocketFrame> implements ConnectManager {

    @Autowired
    private RedisService redisService;

    @Override
    protected void channelRead0(ChannelHandlerContext channelHandlerContext, WebSocketFrame webSocketFrame) throws Exception {
        if (webSocketFrame instanceof TextWebSocketFrame) {
            String request = ((TextWebSocketFrame) webSocketFrame).text();
            System.out.println("接收消息:" + request);
            String msg = "接收成功";
            channelHandlerContext.channel().writeAndFlush(new TextWebSocketFrame(msg));
        } else if (webSocketFrame instanceof BinaryWebSocketFrame) {
            ByteBuf content = webSocketFrame.content();
            byte[] reg = new byte[content.readableBytes()];
            content.readBytes(reg);
            String request = new String(reg, "UTF-8");
            System.out.println("接收消息:" + request);
            String msg = "接收成功";
            ByteBuf respByteBuf = Unpooled.copiedBuffer(msg.getBytes());
            channelHandlerContext.channel().writeAndFlush(new BinaryWebSocketFrame(respByteBuf));
        } else {
            String message = "unsupported frame type: " + webSocketFrame.getClass().getName();
            throw new UnsupportedOperationException(message);
        }
    }

    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        socketClientNums.incrementAndGet();
        socketChannelHandlerContexts.put(1, ctx.channel());
        log.warn("客户端登陆消息服务器");
        log.warn("当前活跃人数{}", socketClientNums);
    }

    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        socketClientNums.decrementAndGet();
        socketChannelHandlerContexts.remove(1);
        log.warn("客户端退出消息服务器");
        log.warn("当前活跃人数{}", socketClientNums);
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        super.channelActive(ctx);
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        Long unReadSize = redisService.getOffMsgSize("1");
        if (unReadSize > 1) {
            JSONObject unread = new JSONObject();
            unread.put("type",3);
            unread.put("num",unReadSize);
            socketChannelHandlerContexts.get(1).writeAndFlush(new TextWebSocketFrame(JSONObject.toJSONString(unread)));
        }
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        super.channelInactive(ctx);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        log.error("连接出错");
        socketChannelHandlerContexts.get(1).writeAndFlush(new TextWebSocketFrame("消息服务器出错"));
        super.exceptionCaught(ctx, cause);
    }
}
