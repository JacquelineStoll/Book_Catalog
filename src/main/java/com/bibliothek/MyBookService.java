package com.bibliothek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyBookService {

    @Autowired
    MyBookRepository myBookRepository;

    public void saveMyBooks(Book book) {
        myBookRepository.save(book);
    }

    public List<Book> getAllMyBooks() {
        return myBookRepository.findAll();
    }

}
