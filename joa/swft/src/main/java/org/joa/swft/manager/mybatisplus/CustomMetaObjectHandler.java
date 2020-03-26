package org.joa.swft.manager.mybatisplus;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author JiangTeJie
 * @since 2020/3/26 18:12
 */

@Slf4j
@Component
public class CustomMetaObjectHandler implements MetaObjectHandler {

    private final String CREATE_TIME = "createTime";

    private final String UPDATE_TIME = "updateTime";

    @Override
    public void insertFill(MetaObject metaObject) {
        if (metaObject.hasGetter(CREATE_TIME) && metaObject.hasGetter(UPDATE_TIME)) {
            this.setFieldValByName(CREATE_TIME, new Date(), metaObject);
            this.setFieldValByName(UPDATE_TIME, new Date(), metaObject);
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        if (metaObject.hasGetter(UPDATE_TIME)) {
            this.setFieldValByName(UPDATE_TIME, new Date(), metaObject);
        }
    }
}
