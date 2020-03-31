package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import org.joa.swft.pojo.entity.validate.Add;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * @author JiangTeJie
 * @since 2020/3/16 18:54
 */
@Data
@TableName(value = "role")
public class Role extends BaseEntity implements Serializable {

    /**主键 id*/
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    /**角色名称*/
    @TableField(value = "role_zh_name")
    @Pattern(regexp = "^[\\u4e00-\\u9fa5]{0,}$",message = "角色名称格式必须为中文", groups = {Add.class})
    @Size(min = 1,max = 12,message = "角色名称格式必须为1~12个字符之间", groups = {Add.class})
    private String roleZhName;

    @TableField(value = "role_en_name")
    @Pattern(regexp = "^\\w+$",message = "字符代码格式必须由数字或英文字母或下划线组成", groups = {Add.class})
    @Size(min = 1,max = 12,message = "字符代码格式必须为1~12个字符之间", groups = {Add.class})
    private String roleEnName;

    /**创建时间*/
    @TableField(value = "create_time")
    private Date createTime;

    /**最近更新时间*/
    @TableField(value = "update_time")
    private Date updateTime;

    /**角色描述*/
    @TableField(value = "role_desc")
    private String roleDesc;

    /**角色是否启用*/
    @TableField(value = "role_enable")
    private Boolean roleEnable;
}
