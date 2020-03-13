package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.joa.swft.pojo.entity.validate.Delete;

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
public class User implements Serializable {

    private String id;

    private String username;

    private String password;

    private String realName;

    private String nickName;

    private String gender;

    private String age;
}
