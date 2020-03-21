package org.joa.swft.exception;

import org.joa.swft.pojo.vo.ResultVO;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.ConstraintViolationException;

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
    public ResultVO defaultError(CustomWebException e){
        return ResultVO.error(e.getCode(),e.getMessage());
    }

    @ExceptionHandler({MethodArgumentNotValidException.class})
    @ResponseBody
    public ResultVO handleBindException(MethodArgumentNotValidException ex) {
        FieldError fieldError = ex.getBindingResult().getFieldError();
        return ResultVO.error(500,fieldError.getDefaultMessage());
    }

    @ResponseBody
    @ExceptionHandler({ConstraintViolationException.class})
    public ResultVO handleSingleParam(ConstraintViolationException ex){
        //ex.getMessage() 可以获取详细信息
        return ResultVO.error(500, "请求参数异常!");
    }
}
