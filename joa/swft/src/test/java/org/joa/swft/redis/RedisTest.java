package org.joa.swft.redis;

import org.joa.swft.service.RedisService;
import org.joa.swft.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author JiangTeJie
 * @since 2020/3/26 14:08
 */
@SpringBootTest
public class RedisTest {

    @Autowired
    private RedisService redisService;

    @Autowired
    private UserService userService;

    @Test
    void saveRedisTest() {
        redisService.setData("test","测试");
    }

    @Test
    void saveMethodParamTest(){
        String authority = userService.getUserAuthority(1);
        System.out.println("[权限]"+authority);
        String authority2 = userService.getUserAuthority(1);
        System.out.println("[权限2]"+authority2);
    }
}
