package org.joa.swft.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.pojo.entity.Permission;
import org.joa.swft.pojo.entity.validate.Add;
import org.joa.swft.pojo.entity.validate.Update;
import org.joa.swft.pojo.vo.PageRespVO;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.PermissionService;
import org.joa.swft.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;

@RestController
@RequestMapping("perm")
@Validated
@Api(value = "权限相关")
public class PermController extends BaseController {

    @Autowired
    private PermissionService permissionService;

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
}
