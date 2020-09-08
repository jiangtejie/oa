package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.OffWorkMapper;
import org.joa.swft.pojo.entity.OffWork;
import org.joa.swft.service.OffWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 上午 11:31
 * @Description: 请假服务
 */
@Service
public class OffWorkServiceImpl extends ServiceImpl<OffWorkMapper, OffWork> implements OffWorkService {

    @Autowired
    private OffWorkMapper offWorkMapper;

}
