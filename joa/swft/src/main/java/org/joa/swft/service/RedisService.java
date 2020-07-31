package org.joa.swft.service;


import org.joa.swft.pojo.vo.WebSocketMessageVO;

/**
 * @Classname RedisService
 * @Description 缓存任务
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
    void setData(String remark, Object data, long timeout);

    /**
     * 保存用户信息
     * @param remark
     * @param data
     */
    void setMsgList(String remark, Object data);

    /**
     * 保存离线信息
     * @param remark
     * @param data
     * @param timeout
     */
    void setMsgList(String remark, Object data, long timeout);

    /**
     * 获取用户的离线消息
     * @param remark
     */
    Object getMsgList(String remark);

    /**
     * 获取离线消息大小
     * @param remark
     * @return
     */
    Long getOffMsgSize(String remark);

    /**
     * 获取数据的方法
     * @param remark
     * @return
     */
    Object getData(String remark);
}
