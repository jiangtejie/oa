package org.joa.swft.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.pojo.entity.Department;
import org.joa.swft.pojo.entity.Permission;
import org.joa.swft.pojo.entity.Role;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.pojo.entity.validate.Add;
import org.joa.swft.pojo.entity.validate.Update;
import org.joa.swft.pojo.vo.PageRespVO;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.PermissionService;
import org.joa.swft.service.RoleService;
import org.joa.swft.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;

/**
 * @author JiangTeJie
 * @since 2020/3/17 20:46
 */

@RestController
@Validated
@RequestMapping("role")
@Api(value = "角色相关")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;

    @ApiOperation(value = "增加角色")
    @PostMapping("")
    public ResultVO addRole(@RequestBody @Validated({Add.class}) Role role) {
        return ResultUtil.result(roleService.save(role));
    }

    @ApiOperation(value = "删除角色")
    @DeleteMapping("{id}")
    public ResultVO deleteRoleById(@PathVariable("id") @Min(value = 0) Integer id) {
        return ResultUtil.result(roleService.deleteRoleById(id));
    }

    @ApiOperation(value = "更新角色")
    @PutMapping("")
    public ResultVO updateRole(@RequestBody @Validated({Update.class}) Role role) {
        return ResultUtil.result(roleService.updateById(role));
    }

    @ApiOperation(value = "查询角色")
    @GetMapping("")
    public ResultVO getRole() {
        return ResultVO.success(roleService.list());
    }
}
