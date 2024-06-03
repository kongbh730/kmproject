package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
<<<<<<< HEAD
@ComponentScan({"com.example.demo","com.data.*","naver.cloud"})
=======
>>>>>>> branch 'main' of https://github.com/kongbh730/kmproject.git
@ComponentScan({"com.example.demo","data.*","naver.cloud","tiles.config"})
@MapperScan("data.mapper")
public class TeamProjectApplication {


	public static void main(String[] args) {
		SpringApplication.run(TeamProjectApplication.class, args);
	}


}
