package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Author: JTJ
 * @Date: 2020/08/26 上午 11:11
 * @Description: 请假单
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OffWork {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    @TableField(value = "user_id")
    private Integer userId;

    @TableField(value = "off_type")
    private String offType;

    @TableField(value = "off_reason")
    private String offReason;

    @TableField(value = "off_start_time")
    private Date offStartTime;

    @TableField(value = "off_end_time")
    private Date offEndTime;

    @TableField(value = "is_allow")
    private Boolean allow;

    @TableField(value = "review_user_id")
    private Integer reviewUserId;

    @TableField(value = "remark")
    private String remark;

    @TableField(value = "is_del")
    private Boolean del;

    @TableField(value = "create_time")
    private Date createTime;

    @TableField(value = "update_time")
    private Date updateTime;
}