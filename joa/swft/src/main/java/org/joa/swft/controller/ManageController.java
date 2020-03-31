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
import org.joa.swft.service.DepartmentService;
import org.joa.swft.service.PermissionService;
import org.joa.swft.service.RoleService;
import org.joa.swft.service.UserService;
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
@Api(value = "系统管理相关请求")
public class ManageController extends BaseController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Autowired
    private DepartmentService departmentService;

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
        return ResultUtil.result(roleService.deleteRoleById(id));
    }

    @ApiOperation(value = "更新角色")
    @PutMapping("role/{id}")
    public ResultVO updateRole(@PathVariable("id") Integer id, @RequestBody @Validated({Update.class}) Role role) {
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

    @ApiOperation(value = "根据id查询用户")
    @GetMapping("user/{id}")
    public ResultVO getUserById(@PathVariable("id") @Min(value = 0) Integer id){
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.setEntity(new User(id));
        return ResultVO.success(userService.list(wrapper));
    }

    @ApiOperation(value = "分页查询用户")
    @GetMapping("user/page")
    public ResultVO getPageUser(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer pageSize){
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.select("number","real_name","gender","age","address","is_enabled");
        Page<User> page = new Page<>(currentPage,pageSize);
        Page<User> dataPage = userService.getBaseMapper().selectPage(page, wrapper);
        return ResultVO.success(new PageRespVO(dataPage));
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
    @GetMapping(value = "perm/page")
    public ResultVO getPerm(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer pageSize){
        Wrapper<Permission> departmentWrapper = new QueryWrapper<>();
        Page<Permission> departmentPage = new Page<>(currentPage,pageSize);
        Page<Permission> permData = permissionService.getBaseMapper().selectPage(departmentPage,departmentWrapper);
        return ResultVO.success(new PageRespVO<>(permData));
    }


    @ApiOperation("获取部门")
    @GetMapping(value = "dept/page")
    public ResultVO getDept(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer pageSize){
        Wrapper<Department> departmentWrapper = new QueryWrapper<>();
        Page<Department> departmentPage = new Page<>(currentPage,pageSize);
        Page<Department> departmentData = departmentService.getBaseMapper().selectPage(departmentPage,departmentWrapper);
        return ResultVO.success(new PageRespVO<>(departmentData));
    }

    @ApiOperation("删除部门")
    @DeleteMapping("dept/{id}")
    public ResultVO deleteDepartment(@PathVariable("id") Integer deptId){
        return ResultUtil.result(departmentService.removeById(deptId));
    }

    @ApiOperation("更新部门")
    @PutMapping("dept")
    public ResultVO updateDepartment(@RequestBody Department department){
        return ResultUtil.result(departmentService.updateById(department));
    }
}
