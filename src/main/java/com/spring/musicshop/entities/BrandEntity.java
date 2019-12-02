package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "brand")
public class BrandEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "brandID")
    private int brandID;

    @Column(name = "brandName")
    private String brandName;

    @OneToMany(mappedBy = "brand")
    private List<ProductEntity> products;

    public BrandEntity() {
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public List<ProductEntity> getProducts() {
        return products;
    }

    public void setProducts(List<ProductEntity> products) {
        this.products = products;
    }
       
}
