package com.ytinne.dev;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class App1Controller {

    @GetMapping("/")
    public String mainPage() {
		return "Greetings from Spring Boot!";
    }
  
    @GetMapping("/build")
    public String buildInfo() {
		return "Build with Maven";
    }

}
