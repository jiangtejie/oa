package org.joa.swft.controller;

import cn.hutool.core.date.DateUtil;
import org.joa.swft.manager.netty.impl.CustomNettyWriterAndReader;
import org.joa.swft.pojo.enums.WebSocketMessageType;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.pojo.vo.WebSocketMessageVO;
import org.joa.swft.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author jtj
 */
@RestController
public class MessageController {

    @Autowired
    private CustomNettyWriterAndReader nettyWriterAndReader;

    @GetMapping("msg")
    public ResultVO sendMsg(HttpServletRequest request, String message) {
        WebSocketMessageVO webSocketMessageVO = WebSocketMessageVO.builder()
                .type(WebSocketMessageType.SYSTEM_MSG.getTypeName())
                .sendUserId(UserUtil.getCurrentUserId())
                .acceptUserId(1)
                .data(message)
                .sendIp(request.getRemoteAddr())
                .createTime(DateUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss"))
                .build();
        nettyWriterAndReader.send(webSocketMessageVO);
        return ResultVO.success();
    }
}

