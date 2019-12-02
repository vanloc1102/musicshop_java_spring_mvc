package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "image")
public class ImageEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "imageID")
    private int imageID;

    @Column(name = "imageURL")
    private String imageURL;

    @ManyToOne
    @JoinColumn(name = "productID")
    private ProductEntity product;

    public ImageEntity() {
    }

    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }
}
