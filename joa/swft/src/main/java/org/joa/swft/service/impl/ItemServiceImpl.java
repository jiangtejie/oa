package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.ItemMapper;
import org.joa.swft.pojo.entity.Item;
import org.joa.swft.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 上午 11:31
 * @Description: 请假服务
 */
@Service
public class ItemServiceImpl extends ServiceImpl<ItemMapper, Item> implements ItemService {

    @Autowired
    private ItemMapper itemMapper;

    @Override
    public List<Item> selectByUserId(Integer userId) {
        QueryWrapper<Item> wrapper = new QueryWrapper();
        wrapper.eq("user_id",userId);
        return itemMapper.selectList(wrapper);
    }
}
