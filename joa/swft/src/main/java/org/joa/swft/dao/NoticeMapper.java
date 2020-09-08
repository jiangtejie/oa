package org.joa.swft.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.joa.swft.pojo.entity.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/4/7 10:46
 */
@Repository("noticeMapper")
public interface NoticeMapper extends BaseMapper<Notice> {

}
