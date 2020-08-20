package org.joa.swft.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.pojo.entity.Department;
import org.joa.swft.pojo.vo.PageRespVO;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.DepartmentService;
import org.joa.swft.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("dept")
@Validated
@Api(value = "用户相关")
public class DeptController extends BaseController {

    @Autowired
    private DepartmentService departmentService;

    @ApiOperation("获取部门")
    @GetMapping(value = "page")
    public ResultVO getDept(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer pageSize){
        Wrapper<Department> departmentWrapper = new QueryWrapper<>();
        Page<Department> departmentPage = new Page<>(currentPage,pageSize);
        Page<Department> departmentData = departmentService.getBaseMapper().selectPage(departmentPage,departmentWrapper);
        return ResultVO.success(new PageRespVO<>(departmentData));
    }

    @ApiOperation("删除部门")
    @DeleteMapping("{id}")
    public ResultVO deleteDepartment(@PathVariable("id") Integer deptId){
        return ResultUtil.result(departmentService.removeById(deptId));
    }

    @ApiOperation("更新部门")
    @PutMapping("")
    public ResultVO updateDepartment(@RequestBody Department department){
        return ResultUtil.result(departmentService.updateById(department));
    }
}
