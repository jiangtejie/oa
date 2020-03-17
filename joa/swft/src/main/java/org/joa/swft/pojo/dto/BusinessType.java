package org.joa.swft.pojo.dto;

/**
 * @author JiangTeJie
 * @since 2020/3/17 17:22
 */
public enum BusinessType {

    LOGIN("登录"),
    REGISTER("注册"),
    LOGOUT("登出"),

    INSERT("添加"),
    DELETE("删除"),
    UPDATE("更新"),
    SELECT("查询")
    ;

    private String type;

    BusinessType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }
}
