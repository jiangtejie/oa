package org.joa.swft.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.joa.swft.pojo.entity.Item;
import org.springframework.stereotype.Repository;

@Repository("itemMapper")
public interface ItemMapper extends BaseMapper<Item> {

}
