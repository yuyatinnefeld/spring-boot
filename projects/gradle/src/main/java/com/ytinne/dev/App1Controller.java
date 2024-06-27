package com.ytinne.dev;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Collections;
import java.util.Map;

@RestController
public class App1Controller {

    @GetMapping("/")
    public String mainPage() {
        return "Greetings from Spring Boot!";
    }

    @GetMapping("/app1")
    @ResponseBody
    public Map<String, String> callApp1Service() {
        return Collections.singletonMap("app_name", "app1");
    }

    @GetMapping("/build")
    public String buildInfo() {
        return "Build with Gradle";
    }
}

