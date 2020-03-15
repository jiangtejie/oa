package org.joa.swft.util;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * @Classname HttpUtil
 * @Description TODO
 * @Date 2019/9/27 0027 18:31
 * @Author by jtj
 */
public class HttpUtil {

    /**
     * 获取请求ip
     *
     * @param request
     * @return
     */
    public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip.substring(0, index);
            } else {
                return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr().equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
    }

}
