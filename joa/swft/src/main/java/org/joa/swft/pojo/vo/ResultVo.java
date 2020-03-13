package org.joa.swft.pojo.vo;

import org.joa.swft.exception.CustomErrorCode;

import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.HashMap;

/**
 * @author JiangTeJie
 * @date 2019/12/2916:20
 */

public class ResultVo <T> extends HashMap implements Serializable {

    private static final long serialVersionUID = -1802122468331526708L;

    private ResultVo(int code, String msg, T data){
        this.put(ResultConstant.RESULT_CODE,code);
        this.put(ResultConstant.RESULT_MSG,msg);
        this.put(ResultConstant.RESULT_DATA,data);
    }

    private ResultVo(int code, String msg){
        this.put(ResultConstant.RESULT_CODE,code);
        this.put(ResultConstant.RESULT_MSG,msg);
    }

    /**
     * 返回成功信息
     * @param data
     * @return
     */
    public static <T> ResultVo success(T data){
        return new ResultVo(HttpServletResponse.SC_OK,ResultConstant.RESULT_OPTION_SUCCESS_DESC,data);
    }

    /**
     * 返回成功信息
     * @param msg
     * @return
     */
    public static <T> ResultVo successWithNonData(String msg){
        return new ResultVo(HttpServletResponse.SC_OK,msg);
    }

    /**
     * 返回失败信息
     * @return
     */
    public static <T> ResultVo error(CustomErrorCode errorCode){
        return new ResultVo(errorCode.getCode(),errorCode.getMsg());
    }

    /**
     * 返回失败信息
     * @return
     */
    public static <T> ResultVo error(Integer code, String message) {
        return new ResultVo(code,message);
    }

    /**
     * 返回失败信息
     * @return
     */
    public static <T> ResultVo error(String message) {
        return new ResultVo(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,message);
    }
}
