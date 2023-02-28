package com.bibliothek;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int b_id;

    private String titel;

    //private Autor autor;
    private String auflage;

    //private Verlag verlag;

    //private Genre genre;

    //private Date veroeffentlichungsDatum;

    //private Ausleihung ausleihung;

    public Book(String titel, String auflage) {
        this.titel = titel;
        this.auflage = auflage;
    }

    //TODO getter + setter

}
