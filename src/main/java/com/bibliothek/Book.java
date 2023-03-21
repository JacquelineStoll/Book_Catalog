package com.bibliothek;

import jakarta.persistence.*;

import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "book")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int b_id;

    private String title;
    @ManyToOne
    @JoinColumn(name = "a_id")
    private Author author;
    private String edition;
    @ManyToOne
    @JoinColumn(name = "p_id")
    private Publisher publisher;
    @ManyToOne
    @JoinColumn(name = "g_id")
    private Genre genre;
    private Date releaseDate;
    @ManyToOne
    @JoinColumn(name = "l_id")
    private Lending lending;
    @Column(columnDefinition = "TEXT")
    private String description;

    public Book(int b_id, String title, Author author, String edition, Publisher publisher, Genre genre, Date releaseDate, Lending lending, String description) {
        this.b_id = b_id;
        this.title = title;
        this.author = author;
        this.edition = edition;
        this.publisher = publisher;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.lending = lending;
        this.description = description;
    }

    public Book() {
        //TODO?
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Lending getLending() {
        return lending;
    }

    public void setLending(Lending lending) {
        this.lending = lending;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
