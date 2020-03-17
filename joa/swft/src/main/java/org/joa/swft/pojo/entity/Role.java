package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author JiangTeJie
 * @since 2020/3/16 18:54
 */
@Data
@TableName(value = "role")
public class Role extends Model<Role> implements Serializable {

    /**主键 id*/
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    /**父亲角色名称*/
    @TableField(value = "parent_id")
    private Integer parentId;

    /**父角色*/
    @TableField(exist = false)
    private Role role;

    /**角色名称*/
    @TableField(value = "role_zh_name")
    private String roleZhName;

    @TableField(value = "role_en_name")
    private String roleEnName;

    /**创建时间*/
    @TableField(value = "create_time")
    private LocalDateTime createTime;

    /**最近更新时间*/
    @TableField(value = "update_time")
    private LocalDateTime updateTime;

    /**角色描述*/
    @TableField(value = "role_desc")
    private String roleDesc;

    /**角色是否启用*/
    @TableField(value = "role_enable")
    private Boolean roleEnable;
}
