package com.bibliothek;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Ausleihung {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int al_id;

    private Date startdatum;
    private Date enddatum;
    private boolean zurueckgegeben;

    public Ausleihung(Date startdatum, Date enddatum, boolean zurueckgegeben) {
        this.startdatum = startdatum;
        this.enddatum = enddatum;
        this.zurueckgegeben = zurueckgegeben;
    }
}
