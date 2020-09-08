package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 下午 02:32
 * @Description: 事项实体
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "item")
public class Item extends BaseEntity{

    /**id序号*/
    @TableId(value = "id",type = IdType.INPUT)
    private Integer id;

    /**事项名称*/
    @TableField(value = "item_title")
    private String itemTitle;

    /**是否完成*/
    @TableField(value = "is_finish")
    private Boolean isFinish;

    /**所属用户*/
    @TableField(value = "user_id")
    private Integer userId;

    /**所属用户*/
    @TableField(value = "user_name")
    private String userName;

    @TableField(value = "create_time")
    private Date createTime;

    @TableField(value = "update_time")
    private Date updateTime;
}
