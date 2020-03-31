package org.joa.swft.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.joa.swft.annotation.OptionLog;
import org.joa.swft.pojo.dto.BusinessType;
import org.joa.swft.pojo.entity.User;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.pojo.vo.UserInfoVO;
import org.joa.swft.service.LogService;
import org.joa.swft.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:11
 */

@RestController
@Api(value = "登录相关请求处理")
public class LoginController extends BaseController{


    @ApiOperation(value="获取用户的信息", notes="角色集合、权限集合")
    @GetMapping("user/info")
    @OptionLog(optionModule = "用户模块",optionType = BusinessType.SELECT, optionDesc = "获取用户信息")
    public ResultVO<UserInfoVO> getUserInfo(){
        User user = UserUtil.getCurrentUser().getUser();
        UserInfoVO userInfoVO = new UserInfoVO(user.getRealName(),user.getAvatar());
        return ResultVO.success(userInfoVO);
    }
}
