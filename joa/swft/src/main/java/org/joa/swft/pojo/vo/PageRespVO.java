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
    private Long currentPage;

    /**一页数据条数*/
    private Long pageSize;

    /**总数*/
    private Long total;

    /**实体数据*/
    private List<T> data;

    public PageRespVO(Page<T> page){
        this.currentPage = page.getCurrent();
        this.pageSize = page.getSize();
        this.total = page.getTotal();
        this.data = page.getRecords();
    }
}
