package org.joa.swft.annotation;

import org.joa.swft.pojo.dto.BusinessType;

import java.lang.annotation.*;

/**
 * @Classname OptionLog
 * @Description 操作日志记录
 * @Date 2019/9/27 0027 18:21
 * @Author by jtj
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OptionLog {

    String optionModule() default ""; // 操作模块

    BusinessType optionType() default BusinessType.SELECT;  // 操作类型,默认是查询操作

    String optionDesc() default "";  // 操作说明

    boolean saveOptionParam() default false;  //是否保存操作内容

}
