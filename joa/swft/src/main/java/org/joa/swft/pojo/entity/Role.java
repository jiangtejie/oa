package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author JiangTeJie
 * @since 2020/3/16 18:54
 */
@Data
@TableName(value = "role")
public class Role {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    @TableField(value = "parent_id")
    private Integer parentId;

    @TableField(value = "role_name")
    private String roleName;

    @TableField(value = "create_time")
    private Date createTime;

    @TableField(value = "update_time")
    private Date updateTime;

    @TableField(value = "role_desc")
    private String roleDesc;
}
