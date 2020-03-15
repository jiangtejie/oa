package org.joa.swft.controller;

import org.joa.swft.pojo.entity.User;
import org.joa.swft.pojo.vo.ResultVO;
import org.joa.swft.pojo.vo.UserInfoVO;
import org.joa.swft.util.UserUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:11
 */

@RestController
public class LoginController extends BaseController{

    /**
     * 获取用户信息
     * @return 头像 姓名
     */
    @GetMapping("user/info")
    public ResultVO<UserInfoVO> getUserInfo(){
        User user = UserUtil.getCurrentUser().getUser();
        UserInfoVO userInfoVO = new UserInfoVO(user.getRealName(),"https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
        return ResultVO.success(userInfoVO);
    }
}
