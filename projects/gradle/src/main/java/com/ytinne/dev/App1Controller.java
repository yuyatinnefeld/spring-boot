package com.ytinne.dev;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class App1Controller {

    @GetMapping("/")
    public String mainPage() {
		return "Greetings from Spring Boot!";
    }
  
    @GetMapping("/app1")
    public String callApp1Service() {
		return "Greetings from App1";
    }

    @GetMapping("/build")
    public String buildInfo() {
		return "Build with Gradle";
    }

}
