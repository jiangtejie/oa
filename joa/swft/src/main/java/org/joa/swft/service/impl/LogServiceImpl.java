package org.joa.swft.service.impl;

import org.joa.swft.dao.LogMapper;
import org.joa.swft.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author JiangTeJie
 * @since 2020/3/16 22:37
 */
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;
}
