package com.unionbank_eurekaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class UnionBankEurekaServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(UnionBankEurekaServerApplication.class, args);
	}

}
