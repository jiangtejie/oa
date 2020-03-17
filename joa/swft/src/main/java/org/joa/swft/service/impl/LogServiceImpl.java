package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.LogMapper;
import org.joa.swft.pojo.entity.Log;
import org.joa.swft.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author JiangTeJie
 * @since 2020/3/16 22:37
 */

@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements LogService {

    @Autowired
    private LogMapper logMapper;
}
