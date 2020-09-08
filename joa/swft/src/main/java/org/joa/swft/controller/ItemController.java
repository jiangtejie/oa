package org.joa.swft.controller;

import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.OffWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 上午 11:45
 * @Description: 请假请求
 */
@RestController
@RequestMapping("offWork")
public class OffWorkController {

    @Autowired
    private OffWorkService offWorkService;

    @GetMapping
    public ResultVO list(){
        return ResultVO.success(offWorkService.list());
    }
}
