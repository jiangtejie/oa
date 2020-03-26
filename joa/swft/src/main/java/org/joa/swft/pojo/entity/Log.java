package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author JiangTeJie
 * @since 2020/3/16 18:52
 */

@Data
@TableName(value = "log")
@AllArgsConstructor
@NoArgsConstructor
public class Log extends Model<Log> implements Serializable {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    /**操作类型*/
    @TableField(value = "option_type")
    private String optionType;

    /**操作模块*/
    @TableField(value = "option_target")
    private String optionTarget;

    /**操作人账号id*/
    @TableField(value = "option_user")
    private Integer optionUser;

    /**操作用户名称*/
    @TableField(value = "option_username")
    private String optionUsername;

    /**操作参数*/
    @TableField(value = "option_params")
    private String optionParams;

    /**IP地址*/
    @TableField(value = "option_ip")
    private String ip;

    /**备注*/
    @TableField(value = "option_remark")
    private String remark;

    /**创建时间*/
    @TableField(value = "create_time")
    private Date createTime;
}
