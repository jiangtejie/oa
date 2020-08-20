package org.joa.swft.manager.netty;

import org.joa.swft.pojo.vo.WebSocketMessageVO;

import java.util.List;

/**
 * @author jtj
 */
public abstract class NettyMessageManager implements ConnectManager {

    /**
     * 发送在线消息
     * @param webSocketMessageVO
     * @return
     */
    protected abstract Boolean send(WebSocketMessageVO webSocketMessageVO);

    /**
     * 获取Redis离线消息
     *
     * @param userId
     * @return
     */
    protected abstract List<WebSocketMessageVO> readInCache(Integer userId);
}
