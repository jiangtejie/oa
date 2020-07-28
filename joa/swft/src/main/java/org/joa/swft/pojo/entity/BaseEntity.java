package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author JiangTeJie
 * @since 2020/3/26 18:05
 */
@Data
public class BaseEntity<T> extends Model implements Serializable {

    /**
     * 创建日期 - 现在时表示主动创建
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 修改时间 - 过去分词表示被动更新
     */
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

}
