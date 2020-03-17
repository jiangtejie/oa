package org.joa.swft.util;

import org.joa.swft.pojo.vo.ResultVO;

/**
 * @author JiangTeJie
 * @since 2020/3/17 21:08
 */
public class ResultUtil {

    public static ResultVO result(boolean flag){
        if(!flag){
            return ResultVO.error();
        }
        return ResultVO.success();
    }
}
