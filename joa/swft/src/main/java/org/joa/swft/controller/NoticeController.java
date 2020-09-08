package org.joa.swft.controller;

import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 上午 10:49
 * @Description: 通知接口
 */
@RequestMapping("notice")
@RestController
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("")
    public ResultVO notice(Integer userId){
        return ResultVO.success(noticeService.selectByUserId(userId));
    }
}
