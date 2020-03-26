package org.joa.swft.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.util.RoomTokenUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author JiangTeJie
 * @since 2020/3/22 9:38
 */

@Api(value = "视频房间相关请求处理")
@RestController
public class RoomVideoController {

    @ApiOperation(value = "获取房间登录token")
    @GetMapping(value = "room/token")
    public ResultVO getRoomToken(){
        //即构分配的appId
        String appid = "2278674198";
        String appSign = "0x16,0x98,0x85,0x11,0x44,0xe2,0x60,0xac,0x9c,0x4b,0x52,0xec,0x6c,0x3f,0xf7,0x07,0x46,0xcb,0xf7,0x0b,0x50,0x54,0x6e,0xc4,0x38,0xea,0x0e,0xcc,0xcf,0x2f,0xb1,0x63";  //即构分配的appSign
        //这里的idname需要和sdk前端传入的idname一致，
        String idName = "roomVideo-1";
        //否则校验失败(因为这里的idname是为了校验和前端传进来的idname是否一致)。
        String Token = RoomTokenUtil.getZeGouToken(appid, appSign, idName);
        return ResultVO.success(Token);
    }
}
