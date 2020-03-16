package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author JiangTeJie
 * @since 2020/3/16 18:52
 */

@Data
@TableName(value = "log")
public class Log {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    @TableField(value = "option_type")
    private Integer optionType;

    @TableField(value = "option_target")
    private String optionTarget;

    @TableField(value = "option_user")
    private Integer optionUser;

    @TableField(value = "create_time")
    private Date createTime;
}
