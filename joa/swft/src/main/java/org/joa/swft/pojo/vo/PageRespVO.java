package org.joa.swft.pojo.vo;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.joa.swft.pojo.entity.User;

import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/3/21 11:26
 */
@Data
public class PageRespVO<T> {

    /**当前页*/
    private Long current;

    /**一页数据条数*/
    private Long size;

    /**总数*/
    private Long total;

    /**实体数据*/
    private List<T> data;

    public PageRespVO(Page<T> page){
        this.current = page.getCurrent();
        this.size = page.getSize();
        this.total = page.getTotal();
        this.data = page.getRecords();
    }

    public static PageRespVO success(Page<User> dataPage) {
        return new PageRespVO(dataPage);
    }
}
