package org.joa.swft.exception;

/**
 * @author JiangTeJie
 * @title: CustomWebExcption
 * @projectName manage
 * @description: 自定义web异常
 * @date 2019/12/2918:55
 */
public class CustomWebException extends BaseException {

    public CustomWebException(Integer code, String msg) {
        super(code, msg);
    }

    public CustomWebException(CustomErrorCode errorCode) {
        super(errorCode.getCode(), errorCode.getMsg());
    }
}
