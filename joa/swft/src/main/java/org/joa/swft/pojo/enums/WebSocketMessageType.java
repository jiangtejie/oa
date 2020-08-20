package org.joa.swft.pojo.enums;

/**
 * @Author: JTJ
 * @Date: 2020/08/19 上午 09:24
 * @Description: Socket消息类型枚举
 */
public enum WebSocketMessageType {

    SYSTEM_MSG(1), USR_MSG(2);

    private Integer typeName;

    WebSocketMessageType(Integer name){
        this.typeName = name;
    }

    public Integer getTypeName() {
        return typeName;
    }
}
