package org.joa.swft.manager.netty;

import io.netty.channel.ChannelHandlerContext;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author jtj
 */
public interface ConnectManager {

    /**
     * 计算当前客户端socket链接数量
     */
    AtomicInteger socketClientNums = new AtomicInteger(0);

    /**
     * 保存当前通道上下文
     */
    ConcurrentHashMap<Integer, ChannelHandlerContext> channelHandlerContexts = new ConcurrentHashMap<>();

}
