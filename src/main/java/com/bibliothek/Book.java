package com.bibliothek;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String titel;

    //private Autor autor;
    private String auflage;

    //private Verlag verlag;

    //private Genre genre;

    //private Date veroeffentlichungsDatum;

    //private Ausleihung ausleihung;

    public Book(){
        //TODO Constructor befüllen
    }

    //TODO getter + setter

}
