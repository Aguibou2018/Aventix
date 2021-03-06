package com.aventix.AventixApp;

import com.aventix.AventixApp.modele.ServiceCompensation;
import java.util.Date;
import java.util.Timer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class AventixAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(AventixAppApplication.class, args);
                Timer timer = new Timer();
                timer.scheduleAtFixedRate(new ServiceCompensation(), 120000, 86400000);
	}

}
