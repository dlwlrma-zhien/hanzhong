package com.lcyy.hanzhong;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class HanzhongApplication {

    public static void main(String[] args) {
        SpringApplication.run(HanzhongApplication.class, args);
    }

}
