package org.joa.swft.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.pojo.entity.Role;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.RoleService;
import org.joa.swft.service.UserService;
import org.joa.swft.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author JiangTeJie
 * @since 2020/3/17 20:46
 */

@RestController
@Api(value = "系统管理相关请求")
public class ManageController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @ApiOperation(value = "增加角色")
    @PostMapping("role")
    public ResultVO addRole(@RequestBody Role role) {
        return ResultUtil.result(roleService.save(role));
    }

    @ApiOperation(value = "删除角色")
    @DeleteMapping("role/{id}")
    public ResultVO deleteRoleById(@PathVariable("id") Integer id) {
        return ResultUtil.result(roleService.removeById(id));
    }

    @ApiOperation(value = "更新角色")
    @PutMapping("role")
    public ResultVO updateRole(@RequestBody Role role) {
        return ResultUtil.result(roleService.updateById(role));
    }

    @ApiOperation(value = "查询角色")
    @GetMapping("role")
    public ResultVO getRole() {
        return ResultVO.success(roleService.list());
    }

    @ApiOperation(value = "增加用户")
    @PostMapping("user")
    public ResultVO<User> addUser(@RequestBody User user) {
        return ResultUtil.result(userService.save(user));
    }

    @ApiOperation(value = "删除用户")
    @DeleteMapping("user/{id}")
    public ResultVO<User> deleteUserById(@PathVariable("id") Integer id) {
        return ResultUtil.result(userService.removeById(id));
    }

    @ApiOperation(value = "更新用户")
    @PutMapping("user")
    public ResultVO updateUser(@RequestBody User user) {
        return ResultUtil.result(userService.updateById(user));
    }

    @ApiOperation(value = "查询用户")
    @GetMapping("user")
    public ResultVO getUser() {
        return ResultVO.success(userService.list());
    }
}
