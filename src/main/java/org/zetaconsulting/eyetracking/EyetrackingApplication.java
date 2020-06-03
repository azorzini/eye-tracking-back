package org.zetaconsulting.eyetracking;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;
import org.zetaconsulting.eyetracking.model.Cliente;

@SpringBootApplication
public class EyetrackingApplication {

	public static final String REST_BASE_URI = "http://localhost:8080/eye-tracking-api/";

	static RestTemplate restTemplate = new RestTemplate();

	public static void main(String[] args) {
		SpringApplication.run(EyetrackingApplication.class, args);
	}
}
