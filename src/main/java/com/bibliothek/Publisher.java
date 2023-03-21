package com.bibliothek;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "publisher")
public class Publisher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int p_id;

    private String description;
    private String location;
    @OneToMany
    @JoinColumn(name = "p_id")
    private List<Book> bookList;

    public Publisher(int p_id, String description, String location, List<Book> bookList) {
        this.p_id = p_id;
        this.description = description;
        this.location = location;
        this.bookList = bookList;
    }

    public Publisher() {
        // TODO ?
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }
}
