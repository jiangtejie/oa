package org.joa.swft.util;

import org.aspectj.lang.ProceedingJoinPoint;
import org.joa.swft.annotation.MethodLog;

import java.lang.reflect.Method;

/**
 * @Classname AnnotationUtil
 * @Description TODO
 * @Date 2019/9/27 0027 18:37
 * @Author by jtj
 */
public class AnnotationUtil {

    /**
     * 获取方法中的中文备注
     *
     * @param joinPoint
     * @return
     * @throws Exception
     */
    public static String getMthodRemark(ProceedingJoinPoint joinPoint) throws Exception {

        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();

        Class targetClass = Class.forName(targetName);
        Method[] method = targetClass.getMethods();
        String methode = "";
        for (Method m : method) {
            if (m.getName().equals(methodName)) {
                Class[] tmpCs = m.getParameterTypes();
                if (tmpCs.length == arguments.length) {
                    MethodLog methodCache = m.getAnnotation(MethodLog.class);
                    if (methodCache != null) {
                        methode = methodCache.remark();
                    }
                    break;
                }
            }
        }
        return methode;
    }
}
