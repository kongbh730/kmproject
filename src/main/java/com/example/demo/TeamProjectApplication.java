package com.example.demo;

<<<<<<< HEAD
=======

>>>>>>> cbbfef5d5b8029c5bc055ad1178eb15bcf2d1ae7
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
<<<<<<< HEAD
@ComponentScan({"com.example.demo","com.data.*","naver.cloud"})
=======
@ComponentScan({"com.example.demo","data.*","naver.cloud","tiles.config"})
>>>>>>> cbbfef5d5b8029c5bc055ad1178eb15bcf2d1ae7
@MapperScan("data.mapper")
public class TeamProjectApplication {


	public static void main(String[] args) {
		SpringApplication.run(TeamProjectApplication.class, args);
	}


}
