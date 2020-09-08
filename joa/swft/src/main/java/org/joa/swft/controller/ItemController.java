package org.joa.swft.controller;

import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 上午 11:45
 * @Description: 事项请求
 */
@RestController
@RequestMapping("item")
public class ItemController {

    @Autowired
    private ItemService itemService;

    @GetMapping
    public ResultVO list(Integer userId){
        return ResultVO.success(itemService.selectByUserId(userId));
    }
}
