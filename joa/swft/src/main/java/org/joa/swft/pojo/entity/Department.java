package org.joa.swft.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author JiangTeJie
 * @since 2020/3/29 20:32
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(value = "department")
public class Department extends BaseEntity implements Serializable {

    /**id序号*/
    @TableId(value = "id",type = IdType.INPUT)
    private Integer id;

    /**部门名称*/
    @TableField(value = "dept_name")
    private String deptName;

    /**部门主管*/
    @TableField(value = "dept_manager")
    private String deptManager;

    /**父级部门*/
    @TableField(value = "parent_dept_id")
    private Integer parentDeptId;

    /**部门人数*/
    @TableField(value = "dept_emp_num")
    private Integer deptEmpNum;

    /**部门描述*/
    @TableField(value = "dept_desc")
    private String deptDesc;
}
