package org.joa.swft.annotation;

import java.lang.annotation.*;

/**
 * @Classname MethodLog
 * @Description 方法日志记录
 * @Date 2019/9/27 0027 18:21
 * @Author by jtj
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MethodLog {

    /**
     * 备注
     * @return
     */
    String remark() default "";

}
