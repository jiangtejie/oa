package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统消息实体
 * @author JiangTeJie
 * @since 2020/4/7 10:25
 */

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Notice extends BaseEntity {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    /**消息标题*/
    @TableField(value = "title")
    private String title;

    @TableField(value = "content")
    private String content;

    /**发布人*/
    @TableField(value = "producer")
    private Integer producer;

    /**附属文件*/
    @TableField(value = "file")
    private String file;
}
