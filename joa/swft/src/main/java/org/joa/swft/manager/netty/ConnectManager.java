package org.joa.swft.manager.netty;

import io.netty.channel.Channel;
import org.joa.swft.pojo.vo.WebSocketMessageVO;

import java.util.List;
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

    /**
     * 计算当前客户端Tcp链接数量
     */
    AtomicInteger tcpClientNums = new AtomicInteger(0);

    /**
     * 保存当前socket通道上下文
     */
    ConcurrentHashMap<Integer, Channel> tcpChannelHandlerContexts = new ConcurrentHashMap<>();

    /**
     * 获取离线消息
     *
     * @param userId
     * @return
     */
    List<WebSocketMessageVO> getOffMsgByUserId(Integer userId);

}
