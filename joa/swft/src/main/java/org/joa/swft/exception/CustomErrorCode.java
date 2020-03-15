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

    LOGIN_FIRST(HttpServletResponse.SC_UNAUTHORIZED,"请先登录!"),
    ACCESS_DENIED(HttpServletResponse.SC_FORBIDDEN,"权限不足!"),
    INVALID_TOKEN(HttpServletResponse.SC_UNAUTHORIZED,"失效token!");

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
