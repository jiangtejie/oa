package org.joa.swft.manager.netty;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.websocketx.BinaryWebSocketFrame;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import lombok.extern.slf4j.Slf4j;

/**
 * @author jtj
 */
@Slf4j
public class WebSocketFrameHandler extends SimpleChannelInboundHandler<WebSocketFrame> {

    @Override
    protected void channelRead0(ChannelHandlerContext channelHandlerContext, WebSocketFrame webSocketFrame) throws Exception {
        if (webSocketFrame instanceof TextWebSocketFrame) {
            String request = ((TextWebSocketFrame) webSocketFrame).text();
            System.out.println("接收消息:" + request);

            String msg = "接收成功";
            //返回信息
            channelHandlerContext.channel().writeAndFlush(new TextWebSocketFrame(msg));
        } else if (webSocketFrame instanceof BinaryWebSocketFrame) {
            //二进制
            ByteBuf content = webSocketFrame.content();
            byte[] reg = new byte[content.readableBytes()];
            content.readBytes(reg);
            String request = new String(reg, "UTF-8");
            System.out.println("接收消息:" + request);

            String msg = "接收成功";
            //返回信息
            ByteBuf respByteBuf = Unpooled.copiedBuffer(msg.getBytes());
            channelHandlerContext.channel().writeAndFlush(new BinaryWebSocketFrame(respByteBuf));
        } else {
            String message = "unsupported frame type: " + webSocketFrame.getClass().getName();
            throw new UnsupportedOperationException(message);
        }
    }
}
