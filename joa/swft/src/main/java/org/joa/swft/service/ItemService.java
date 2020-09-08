package org.joa.swft.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.joa.swft.pojo.entity.Item;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 上午 11:30
 * @Description:  请假服务
 */
@Service
public interface ItemService extends IService<Item> {

    List<Item> selectByUserId(Integer userId);
}
