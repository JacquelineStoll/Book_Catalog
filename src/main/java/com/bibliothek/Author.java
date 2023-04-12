package com.bibliothek;

import jakarta.persistence.*;

import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "author")
public class Author {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int a_id;

    private String forename;
    private String surname;
    private Date dateOfBirth;
    @OneToMany
    @JoinColumn(name = "a_id")
    private List<Book> book;

    public Author(int a_id, String forename, String surname, Date dateOfBirth) {
        this.a_id = a_id;
        this.forename = forename;
        this.surname = surname;
        this.dateOfBirth = dateOfBirth;
    }

    public Author() {
    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getForename() {
        return forename;
    }

    public void setForename(String forename) {
        this.forename = forename;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public List<Book> getBook() {
        return book;
    }

    public void setBook(List<Book> book) {
        this.book = book;
    }
}
