package com.bibliothek;

import jakarta.persistence.*;

import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "lending")
public class Lending {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int l_id;

    private Date startDate;
    private Date endDate;
    private Date returnDate;
    @ManyToOne
    @JoinColumn(name = "u_id")
    private User user;
    @OneToMany
    @JoinColumn(name = "b_id")
    private List<Book> book;

    public Lending(int l_id, Date startDate, Date endDate, Date returnDate, User user, List<Book> book) {
        this.l_id = l_id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.returnDate = returnDate;
        this.user = user;
        this.book = book;
    }

    public Lending() {
        //TODO ?
    }

    public int getL_id() {
        return l_id;
    }

    public void setL_id(int l_id) {
        this.l_id = l_id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Book> getBooks() {
        return book;
    }

    public void addBook(Book book) {
        this.book.add(book);
    }
}
