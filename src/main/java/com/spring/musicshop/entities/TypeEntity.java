package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "type")
public class TypeEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "typeID")
    private int typeID;

    @Column(name = "typeName")
    private String typeName;

   @OneToMany(mappedBy = "type")
   private List<ProductEntity> products;

    public TypeEntity() {
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public List<ProductEntity> getProducts() {
        return products;
    }

    public void setProducts(List<ProductEntity> products) {
        this.products = products;
    }

}
