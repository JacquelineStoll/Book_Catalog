package com.bibliothek;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "genre")
public class Genre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int g_id;

    /*@Enumerated(EnumType.STRING)
    private GenreName genreName;*/
    private String name;

    @OneToMany
    @JoinColumn(name = "b_id")
    private List<Book> bookList;

    public Genre(int g_id, String name, List<Book> bookList) {
        this.g_id = g_id;
        this.name = name;
        this.bookList = bookList;
    }

    public Genre() {
        //TODO ?
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }
}
