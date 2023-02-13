package com.bibliothek;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookCatalogController {

    @RequestMapping("/home")
    public String home() {
        return "home";
    }

}
