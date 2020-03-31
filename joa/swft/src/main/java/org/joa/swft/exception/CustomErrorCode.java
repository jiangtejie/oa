package org.joa.swft.exception;

import javax.servlet.http.HttpServletResponse;

/**
 * @author JiangTeJie
 * @title: CustomErrorCode
 * @projectName manage
 * @description: TODO
 * @date 2019/12/2916:44
 */
public enum CustomErrorCode {
    /**
     * 50008：不正确的token值 ；
     * 50012：有其他的客户端已经登录；
     * 50014：token过期
     */
    ACCESS_DENIED(50401,"权限不足!"),
    INVALID_TOKEN(50014,"失效token!");

    private int code;

    private String msg;

    CustomErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }


    public String getMsg() {
        return msg;
    }

}
