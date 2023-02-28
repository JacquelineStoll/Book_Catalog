package com.bibliothek;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Verlag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int v_id;

    private String name;
    private String Standort;

    public Verlag(String name, String standort) {
        this.name = name;
        Standort = standort;
    }
}
