package com.bibliothek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    //TODO abändern nach Bedarf
    public void save(Book b) {
        bookRepository.save(b);
    }

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

}
