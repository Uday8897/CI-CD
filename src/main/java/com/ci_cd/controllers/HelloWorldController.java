package com.ci_cd.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
    @GetMapping("/hello")
    public String get(){
        return "Hello World";
    }
    @GetMapping("/bye")
    public  String bye() {
        return "Bye ";
    }
    @GetMapping("/uday")
    public String uday(){
        return "Uday is Erripuku";
    }
}
