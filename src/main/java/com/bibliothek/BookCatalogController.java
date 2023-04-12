package com.bibliothek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BookCatalogController {

    @Autowired
    private BookService bookService;

    @Autowired
    private MyBookService myBookService;

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
    public String myBooks(Model model) {
        List<Book> list = myBookService.getAllMyBooks();
        model.addAttribute("book", list);
        return "myBooks";
    }

    @RequestMapping("/mylist/{id}")
    public String getMyList(@PathVariable("id") int id) {
        Book b = bookService.getBookById(id);
        b.getAuthor().getForename();
        b.getGenre().getName();
        myBookService.saveMyBooks(b);
        return "redirect:/myBooks.html";
    }

    @RequestMapping("loginPage.html")
    public String lendingService() {
        return "loginPage";
    }

}
