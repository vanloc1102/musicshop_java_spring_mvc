package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "category")
public class CategoryEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "categoryID")
    private int categoryID;

    @Column(name = "categoryName")
    private String categoryName;

    @OneToMany(mappedBy = "category")
    private List<ProductEntity> products;

    public CategoryEntity() {
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public List<ProductEntity> getProducts() {
        return products;
    }

    public void setProducts(List<ProductEntity> products) {
        this.products = products;
    }

}
