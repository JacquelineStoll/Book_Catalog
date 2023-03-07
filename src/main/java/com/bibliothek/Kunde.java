package com.bibliothek;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Kunde {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int k_id;

    private String vorname;
    private String nachname;
    private Date geburtsdatum;
    private String strasse;
    private String hausnummer;
    private String plz;
    private String ort;

    public Kunde(String vorname, String nachname, Date geburtsdatum, String strasse, String hausnummer, String plz,
            String ort) {
        this.vorname = vorname;
        this.nachname = nachname;
        this.geburtsdatum = geburtsdatum;
        this.strasse = strasse;
        this.hausnummer = hausnummer;
        this.plz = plz;
        this.ort = ort;
    }
}
