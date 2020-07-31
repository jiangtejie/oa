package org.joa.swft.manager.netty;

/**
 * @author jtj
 */
public interface NettyWriter extends ConnectManager {

    /**
     * 发送消息
     * @param userId
     * @param msg
     * @param sendType
     * @return
     */
    Boolean send(Integer userId, String msg, NettySendType sendType);


    enum NettySendType {

        WEBSOCKET_TYPE("ws"), TCP_TYPE("tcp");

        private String typeName;

        NettySendType(String name) {
            this.typeName = name;
        }
    }
}
