package org.joa.swft.service;


/**
 * @Classname RedisService
 * @Description TODO
 * @Date 2019/10/9 0009 10:48
 * @Author by jtj
 */
public interface RedisService {

    /**
     * 不带超时时间设置
     * @param remark
     * @param data
     */
    void setData(String remark, Object data);

    /**
     * 自定义超时时间
     * @param remark
     * @param data
     * @param timeout
     */
    void setDataWithTime(String remark, Integer data, long timeout);

    /**
     * 获取数据的方法
     * @param remark
     * @return
     */
    Object getData(String remark);
}
