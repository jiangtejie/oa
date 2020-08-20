package org.joa.swft.manager.netty;

import io.netty.channel.Channel;

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
     * 保存当前socket通道上下文
     */
    ConcurrentHashMap<Integer, Channel> socketChannelHandlerContexts = new ConcurrentHashMap<>();
}
