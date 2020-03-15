package org.joa.swft;

import org.joa.swft.pojo.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SwftApplicationTests {

    @Test
    void testUser() {
        User user = new User("张三");
        System.out.println(user.toString());
    }

}
