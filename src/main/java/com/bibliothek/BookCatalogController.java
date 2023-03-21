package com.bibliothek;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BookCatalogController {

    @Autowired
    private BookService bookService;

    @GetMapping("home.html")
    public String home() {
        return "home";
    }

    @RequestMapping("availableBooks.html")
    public ModelAndView getAllBooks() {
        List<Book> list=bookService.getAllBooks();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("availableBooks");
        modelAndView.addObject("book", list);
        return new ModelAndView("availableBooks", "book", list);
    }

    @RequestMapping("myBooks.html")
    public String myBooks() {
        return "myBooks";
    }

    @RequestMapping("loginPage.html")
    public String lendingService() {
        return "loginPage";
    }

}
