package org.joa.swft.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.pojo.entity.validate.Add;
import org.joa.swft.pojo.entity.validate.Update;
import org.joa.swft.pojo.vo.PageRespVO;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.service.UserService;
import org.joa.swft.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.Min;

@RestController
@RequestMapping("user")
@Validated
@Api(value = "用户相关")
public class UserController extends BaseController {


    @Autowired
    private UserService userService;

    @ApiOperation(value = "增加用户")
    @PostMapping("")
    public ResultVO<User> addUser(@RequestBody @Validated({Add.class}) User user) {
        return ResultUtil.result(userService.save(user));
    }

    @ApiOperation(value = "删除用户")
    @DeleteMapping("{id}")
    public ResultVO<User> deleteUserById(@PathVariable("id") @Min(value = 0) Integer id) {
        return ResultUtil.result(userService.removeById(id));
    }

    @ApiOperation(value = "更新用户")
    @PutMapping("")
    public ResultVO updateUser(@RequestBody @Validated({Update.class}) User user) {
        return ResultUtil.result(userService.updateById(user));
    }

    @ApiOperation(value = "根据id查询用户")
    @GetMapping("{id}")
    public ResultVO getUserById(@PathVariable("id") @Min(value = 0) Integer id){
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.setEntity(new User(id));
        return ResultVO.success(userService.list(wrapper));
    }

    @ApiOperation(value = "分页查询用户")
    @GetMapping("page")
    public ResultVO getPageUser(@RequestParam(defaultValue = "1") Integer currentPage, @RequestParam(defaultValue = "10") Integer pageSize){
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.select("number","real_name","gender","age","address","is_enabled");
        Page<User> page = new Page<>(currentPage,pageSize);
        Page<User> dataPage = userService.getBaseMapper().selectPage(page, wrapper);
        return ResultVO.success(new PageRespVO(dataPage));
    }
}
