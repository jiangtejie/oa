package org.joa.swft.pojo.vo;

import org.joa.swft.exception.CustomErrorCode;

import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.HashMap;

/**
 * @author JiangTeJie
 * @date 2019/12/2916:20
 */

public class ResultVO<T> extends HashMap implements Serializable {

    private static final long serialVersionUID = -1802122468331526708L;

    private ResultVO(int code, String msg, T data){
        this.put(ResultConstant.RESULT_CODE,code);
        this.put(ResultConstant.RESULT_MSG,msg);
        this.put(ResultConstant.RESULT_DATA,data);
    }

    private ResultVO(int code, String msg){
        this.put(ResultConstant.RESULT_CODE,code);
        this.put(ResultConstant.RESULT_MSG,msg);
    }

    /**
     * 返回成功信息
     * @param data
     * @return
     */
    public static <T> ResultVO success(T data){
        return new ResultVO(ResultConstant.RESULT_SUCCESS_CODE,ResultConstant.RESULT_OPTION_SUCCESS_DESC,data);
    }

    /**
     * 返回成功信息
     * @return
     */
    public static <T> ResultVO success(){
        return new ResultVO(HttpServletResponse.SC_OK,ResultConstant.RESULT_OPTION_SUCCESS_DESC);
    }

    /**
     * 返回失败信息
     * @return
     */
    public static <T> ResultVO error(CustomErrorCode errorCode){
        return new ResultVO(errorCode.getCode(),errorCode.getMsg());
    }

    /**
     * 返回失败信息
     * @return
     */
    public static <T> ResultVO error(Integer code, String message) {
        return new ResultVO(code,message);
    }

    /**
     * 返回失败信息
     * @return
     */
    public static <T> ResultVO error(String message) {
        return new ResultVO(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,message);
    }

    /**
     * 返回失败信息
     * @return
     */
    public static <T> ResultVO error() {
        return new ResultVO(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,ResultConstant.RESULT_OPTION_FAIL_DESC);
    }
}
