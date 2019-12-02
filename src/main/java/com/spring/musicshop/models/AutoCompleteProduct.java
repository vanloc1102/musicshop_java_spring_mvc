package com.spring.musicshop.models;

public class AutoCompleteProduct {

    private int id;
    private String name;

    public AutoCompleteProduct() {
    }

    public AutoCompleteProduct(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
