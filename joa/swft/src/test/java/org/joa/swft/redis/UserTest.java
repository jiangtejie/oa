package org.joa.swft.redis;

import org.joa.swft.pojo.entity.User;
import org.joa.swft.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.UUID;

/**
 * @author JiangTeJie
 * @since 2020/3/26 18:19
 */
@SpringBootTest
public class UserTest {

    @Autowired
    private UserService userService;

    @Test
    void saveUser() {
        User user = new User();
        user.setUsername("18171860540");
        user.setAddress("重庆丰都");
        user.setAge(23);
        user.setAge(12);
        user.setGender(1);
        user.setNumber(UUID.randomUUID().toString().replace("-",""));
        user.setRealName("李逍遥");
        if(userService.save(user)){
            System.out.println("插入成功");
        }else{
            System.out.println("插入失败");
        }
    }
}
