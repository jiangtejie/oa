package org.joa.swft.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author JiangTeJie
 * @since 2020/3/15 12:36
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInfoVO {

    private Integer userId;

    private String name;

    private String avatar;
}
