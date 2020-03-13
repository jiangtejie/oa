package org.joa.swft.exception;

import org.joa.swft.pojo.vo.ResultVo;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author JiangTeJie
 * @title: CustomWebExceptionHandler
 * @projectName manage
 * @description: 自定义异常全局捕获
 * @date 2019/12/2918:57
 */
@ControllerAdvice
public class CustomWebExceptionHandler {

    @ResponseBody
    @ExceptionHandler({CustomWebException.class})
    public ResultVo defaultError(CustomWebException e){
        return ResultVo.error(e.getCode(),e.getMessage());
    }
}
