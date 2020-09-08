package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.NoticeMapper;
import org.joa.swft.pojo.entity.Notice;
import org.joa.swft.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/4/7 10:45
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper,Notice> implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> selectByUserId(Integer userId) {
        QueryWrapper<Notice> wrapper = new QueryWrapper();
        wrapper.eq("producer",userId);
        return noticeMapper.selectList(wrapper);
    }
}
