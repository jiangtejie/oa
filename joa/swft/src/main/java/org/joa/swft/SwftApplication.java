package org.joa.swft;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("org.joa.swft.dao")
public class SwftApplication {

    public static void main(String[] args) {
        SpringApplication.run(SwftApplication.class, args);
    }

}
