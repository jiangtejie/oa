package org.joa.swft.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author JiangTeJie
 * @since 2020/3/17 16:49
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogDto {

    private String optionModule;

    private String optionType;

    private String optionDesc;

    private Boolean saveOptionParam;
}
