package org.joa.swft.pojo.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;
import org.joa.swft.pojo.entity.validate.Add;
import org.joa.swft.pojo.entity.validate.Delete;
import org.joa.swft.pojo.entity.validate.Update;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:36
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "user")
public class User extends BaseEntity<User> implements Serializable {

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

    @TableField(value = "avatar")
    private String avatar;

    /**性别*/
    @TableField(value = "gender")
    @Range(min = 0,max = 1,message = "请正确填写性别",groups = {Add.class})
    private Integer gender;

    /**年龄*/
    @TableField(value = "age")
    @Range(min = 1,max = 100,message = "请正确填写年龄",groups = {Add.class})
    private Integer age;

    /**地址*/
    @TableField(value = "address")
    @NotNull(message = "地址不能为空")
    private String address;

    /**部门id*/
    @TableField(value = "dept_id")
    @NotNull(message = "部门不能为空",groups = {Add.class})
    private Integer deptId;

    /**登录ip*/
    @TableField(value = "login_ip")
    private String loginIp;

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

    public User(int id){
        this.id = id;
    }

    public User(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return JSONObject.toJSONString(this);
    }
}
