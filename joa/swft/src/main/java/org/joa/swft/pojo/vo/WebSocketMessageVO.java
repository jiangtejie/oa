package org.joa.swft.pojo.vo;

import com.alibaba.fastjson.JSONObject;
import lombok.*;

/**
 * @author jtj
 */
@Builder
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WebSocketMessageVO {

    /**
     * 消息类型 1:系统未读消息  2:其他消息
     */
    private String type;

    /**
     * 消息数据
     */
    private JSONObject data;
}
