package org.joa.swft.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author JiangTejie
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HolidayInfoDto {

    /**请假类型*/
    private Integer type;

    /**开始时间*/
    private Date startTime;

    /**结束时间*/
    private Date endTime;

    /**是否立即抄送，默认不抄送，可在草稿箱里面查看*/
    private Boolean isSubmit = false;
}
