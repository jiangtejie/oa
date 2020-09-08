package org.joa.swft.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.joa.swft.pojo.entity.Notice;

import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/4/7 10:42
 */
public interface NoticeService extends IService<Notice> {

    List<Notice> selectByUserId(Integer userId);
}
