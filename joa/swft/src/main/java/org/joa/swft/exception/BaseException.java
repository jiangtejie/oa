package org.joa.swft.exception;

import lombok.Data;

/**
 * @author JiangTeJie
 * @title: BaseException
 * @projectName manage
 * @description: 自定义基本异常
 * @date 2019/12/2918:54
 */
@Data
public class BaseException extends RuntimeException {

    private Integer code;

    public BaseException(Integer code, String msg) {
        super(msg);
        this.code = code;
    }
}
