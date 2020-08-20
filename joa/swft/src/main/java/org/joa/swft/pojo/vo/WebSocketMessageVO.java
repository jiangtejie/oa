package org.joa.swft.pojo.vo;

import lombok.*;

import java.io.Serializable;

/**
 * @author jtj
 */
@Builder
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WebSocketMessageVO implements Serializable {

    /**消息类型 1:系统未读消息  2:用户消息*/
    private Integer type;

    /**发送方用户ID*/
    private Integer sendUserId;

    /**发送方用户IP地址*/
    private String sendIp;

    /**接受方用户ID*/
    private Integer acceptUserId;

    /**消息数据*/
    private Object data;

    /**发送时间*/
    private String createTime;
}
