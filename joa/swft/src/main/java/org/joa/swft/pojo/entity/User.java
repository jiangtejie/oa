package org.joa.swft.pojo.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joa.swft.pojo.entity.validate.Delete;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:36
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "user")
public class User implements Serializable {

    /**id*/
    /**主键*/
    @TableId(value = "id",type = IdType.INPUT)
    @NotNull(message = "请选择一个用户",groups = {Delete.class})
    private Integer id;

    /**编号*/
    @TableId(value = "number",type = IdType.ASSIGN_UUID)
    private String number;

    /**账号*/
    @TableField(value = "username")
    private String username;

    /**密码*/
    @TableField(value = "password")
    private String password;

    /**真实姓名*/
    @TableField(value = "real_name")
    private String realName;

    /**性别*/
    @TableField(value = "gender")
    private String gender;

    /**年龄*/
    @TableField(value = "age")
    private String age;

    /**地址*/
    @TableField(value = "address")
    private String address;

    /**登录ip*/
    @TableField(value = "login_ip")
    private String loginIp;

    /**创建时间*/
    @TableField(value = "create_time")
    private Date createTime;

    /**更新时间*/
    @TableField(value = "update_time")
    private Date updateTime;

    /**账号是否过期*/
    @TableField(value = "is_account_non_expired")
    private Boolean accountNonExpired;

    /**账号是否锁定*/
    @TableField(value = "is_account_non_locked")
    private Boolean accountNonLocked;

    /**账户是否可用*/
    @TableField(value = "is_enabled")
    private Boolean enabled;

    /**凭证是否过期（提醒用户修改密码）*/
    @TableField(value = "is_credentials_non_expired")
    private Boolean credentialsNonExpired;

    public User(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return JSONObject.toJSONString(this);
    }
}
