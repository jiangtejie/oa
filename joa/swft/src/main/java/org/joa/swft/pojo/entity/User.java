package org.joa.swft.pojo.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joa.swft.pojo.entity.validate.Add;
import org.joa.swft.pojo.entity.validate.Delete;
import org.joa.swft.pojo.entity.validate.Update;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
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
public class User extends Model<User> implements Serializable {

    /**id*/
    /**主键*/
    @TableId(value = "id",type = IdType.INPUT)
    @NotNull(message = "请选择一个用户",groups = {Delete.class, Update.class})
    private Integer id;

    /**编号*/
    @TableId(value = "number",type = IdType.ASSIGN_UUID)
    private String number;

    /**账号*/
    @TableField(value = "username")
    @NotNull(message = "用户名不能为空",groups = {Add.class})
    private String username;

    /**密码*/
    @TableField(value = "password")
    @NotNull(message = "用户名不能为空",groups = {Add.class})
    @Max(value = 16,message = "密码不能超过16位",groups = {Add.class})
    @Min(value = 6,message = "密码不能低于6位",groups = {Add.class})
    private String password;

    /**真实姓名*/
    @TableField(value = "real_name")
    @NotNull(message = "姓名不能为空",groups = {Add.class})
    private String realName;

    /**性别*/
    @TableField(value = "gender")
    @NotNull(message = "性别不能为空",groups = {Add.class})
    private String gender;

    /**年龄*/
    @TableField(value = "age")
    @Min(value = 0,message = "年龄不能为负数",groups = {Add.class})
    @Max(value = 100,message = "你这么大岁数，还玩电脑，我不信O(∩_∩)O",groups = {Add.class})
    private String age;

    /**地址*/
    @TableField(value = "address")
    @NotNull(message = "地址不能为空")
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

    /**登录次数*/
    @TableField(value = "login_count")
    private Integer loginCount;

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
