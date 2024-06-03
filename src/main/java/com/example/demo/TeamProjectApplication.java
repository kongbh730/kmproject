package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.example.demo","data.*","naver.cloud","tiles.config"})
		public class TeamProjectApplication {

		public static void main(String[] args) {
	SpringApplication.run(TeamProjectApplication.class, args);
}

}
