package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author JiangTeJie
 * @since 2020/3/16 19:03
 */
@Data
@TableName(value = "permission")
public class Permission extends Model<Permission> implements Serializable {

    @TableId(value = "id")
    private Integer id;

    @TableField(value = "parent_id")
    private Integer parentId;

    @TableField(value = "perm_name")
    private String permName;

    @TableField(value = "perm_desc")
    private String permDesc;

    @TableField(value = "create_time")
    private LocalDateTime createTime;

    @TableField(value = "update_time")
    private LocalDateTime updateTime;
}
