package org.joa.swft.annotation;

import java.lang.annotation.*;

/**
 * @author JiangTeJie
 * @since 2020/3/31 13:23
 */

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface RepeatSubmit {

    /**
     * 前缀
     * @return
     */
    String prefix() default "prefix:";
}
