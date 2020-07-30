package org.joa.swft.manager.netty;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.codec.http.FullHttpRequest;
import lombok.extern.slf4j.Slf4j;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

/**
 * @author jtj
 */
@Slf4j
public class ServerHandler extends ChannelInboundHandlerAdapter implements ConnectManager {

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws UnsupportedEncodingException {
        if(msg instanceof FullHttpRequest){
            ByteBuf byteBuf = (ByteBuf) msg;
            System.out.print(byteBuf.toString(Charset.defaultCharset()));
        }
        ctx.fireChannelRead(msg);
    }

    /**
     * channelActive()方法会在客户端与服务器建立连接后调用
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        socketClientNums.incrementAndGet();
        log.warn("当前在线连接数{}",socketClientNums.get());
    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        socketClientNums.decrementAndGet();
        log.warn("当前在线连接数{}",socketClientNums.get());
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        cause.printStackTrace();
        ctx.close();
    }
}
