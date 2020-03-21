package org.joa.swft.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.pojo.entity.Permission;
import org.joa.swft.pojo.entity.Role;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.pojo.entity.validate.Add;
import org.joa.swft.pojo.entity.validate.Update;
import org.joa.swft.pojo.vo.PageRespVO;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.PermissionService;
import org.joa.swft.service.RoleService;
import org.joa.swft.service.UserService;
import org.joa.swft.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;
import java.util.Map;

/**
 * @author JiangTeJie
 * @since 2020/3/17 20:46
 */

@RestController
@Validated
@Api(value = "系统管理相关请求")
public class ManageController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Autowired
    private PermissionService permissionService;

    @ApiOperation(value = "增加角色")
    @PostMapping("role")
    public ResultVO addRole(@RequestBody @Validated({Add.class}) Role role) {
        return ResultUtil.result(roleService.save(role));
    }

    @ApiOperation(value = "删除角色")
    @DeleteMapping("role/{id}")
    public ResultVO deleteRoleById(@PathVariable("id") @Min(value = 0) Integer id) {
        return ResultUtil.result(roleService.removeById(id));
    }

    @ApiOperation(value = "更新角色")
    @PutMapping("role")
    public ResultVO updateRole(@RequestBody @Validated({Update.class}) Role role) {
        return ResultUtil.result(roleService.updateById(role));
    }

    @ApiOperation(value = "查询角色")
    @GetMapping("role")
    public ResultVO getRole() {
        return ResultVO.success(roleService.list());
    }

    @ApiOperation(value = "增加用户")
    @PostMapping("user")
    public ResultVO<User> addUser(@RequestBody @Validated({Add.class}) User user) {
        return ResultUtil.result(userService.save(user));
    }

    @ApiOperation(value = "删除用户")
    @DeleteMapping("user/{id}")
    public ResultVO<User> deleteUserById(@PathVariable("id") @Min(value = 0) Integer id) {
        return ResultUtil.result(userService.removeById(id));
    }

    @ApiOperation(value = "更新用户")
    @PutMapping("user")
    public ResultVO updateUser(@RequestBody @Validated({Update.class}) User user) {
        return ResultUtil.result(userService.updateById(user));
    }

    @ApiOperation(value = "查询用户")
    @GetMapping("user")
    public ResultVO getUser() {
        return ResultVO.success(userService.list());
    }

    @GetMapping("user/page/{currentPage}")
    public PageRespVO getPageUser(@PathVariable("currentPage") int currentPage, @RequestParam(defaultValue = "10") int pageSize){
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.select("number","real_name","gender","age","address","is_enabled");
        Page<User> page = new Page<>(currentPage,pageSize);
        Page<User> DataPage = userService.getBaseMapper().selectPage(page, wrapper);
        return PageRespVO.success(DataPage);
    }

    @ApiOperation("增加权限")
    @PostMapping(value = "perm")
    public ResultVO addPerm(@RequestBody @Validated({Add.class}) Permission permission){
        return ResultUtil.result(permissionService.save(permission));
    }

    @ApiOperation("删除权限")
    @DeleteMapping("perm/{id}")
    public ResultVO deletePerm(@PathVariable @Min(value = 0) Integer id){
        return ResultUtil.result(permissionService.removeById(id));
    }

    @ApiOperation("更新权限")
    @PutMapping("perm")
    public ResultVO updatePerm(@RequestBody @Validated({Update.class}) Permission permission){
        return ResultUtil.result(permissionService.updateById(permission));
    }

    @ApiOperation("查询权限")
    @GetMapping(value = "perm")
    public ResultVO getPerm(){
        return ResultVO.success(permissionService.list());
    }
}
