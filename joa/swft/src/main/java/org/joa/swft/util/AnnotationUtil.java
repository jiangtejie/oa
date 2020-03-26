package org.joa.swft.util;

import org.aspectj.lang.ProceedingJoinPoint;
import org.joa.swft.annotation.OptionLog;
import org.joa.swft.pojo.dto.LogDto;

import java.lang.reflect.Method;

/**
 * @Classname AnnotationUtil
 * @Description 日志切面
 * @Date 2019/9/27 0027 18:37
 * @Author by jtj
 */
public class AnnotationUtil {

    /**
     * 获取操作模块
     * @param joinPoint
     * @return
     * @throws Exception
     */
    public static LogDto getOptionModule(ProceedingJoinPoint joinPoint) throws Exception {

        LogDto logDto = null;

        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();

        Class targetClass = Class.forName(targetName);
        Method[] method = targetClass.getMethods();
        for (Method m : method) {
            if (m.getName().equals(methodName)) {
                Class[] tmpCs = m.getParameterTypes();
                if (tmpCs.length == arguments.length) {
                    OptionLog methodCache = m.getAnnotation(OptionLog.class);
                    if (methodCache != null) {
                        logDto = new LogDto(methodCache.optionModule(),methodCache.optionType().getType(),methodCache.optionDesc(),methodCache.saveOptionParam());
                    }
                    break;
                }
            }
        }
        return logDto;
    }
}
