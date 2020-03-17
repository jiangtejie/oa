package org.joa.swft.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @author JiangTeJie
 * @title: ServletUtil
 * @projectName sql-source
 * @description: TODO
 * @date 2019/12/1418:56
 */
public class ServletUtil {

    /**
     * 是否是ajax请求
     * @param request
     * @return
     */
    public static boolean isAjaxRequest(HttpServletRequest request) {
        String ajaxFlag = request.getHeader("X-Requested-With");
        return ajaxFlag != null && "XMLHttpRequest".equals(ajaxFlag);
    }
    /**
     * 获取request对象
     * @return
     */
    public static HttpServletRequest getHttpServletRequest(){
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return servletRequestAttributes.getRequest();
    }

    /**
     * 获取response对象
     * @return
     */
    public static HttpServletResponse getHttpServletResponse(){
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return servletRequestAttributes.getResponse();
    }


    /**
     * 转换request 请求参数
     *
     * @param paramMap request获取的参数数组
     */
    public static Map<String, String> converMap(Map<String, String[]> paramMap) {
        Map<String, String> rtnMap = new HashMap<String, String>(16);
        if(paramMap.isEmpty()){
            return Collections.emptyMap();
        }
        for (String key : paramMap.keySet()) {
            rtnMap.put(key, paramMap.get(key)[0]);
        }
        return rtnMap;
    }
}
