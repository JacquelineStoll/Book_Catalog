package com.bibliothek;

import jakarta.persistence.*;

@Entity
@Table(name = "genre")
public class Genre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int g_id;

    @Enumerated(EnumType.STRING)
    private String name;

    public Genre(int g_id, String name) {
        this.g_id = g_id;
        this.name = name;
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
}
