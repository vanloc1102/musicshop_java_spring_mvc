package com.spring.musicshop.entities;

import java.io.Serializable;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product")
public class ProductEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productID")
    private int productID;

    @Column(name = "productName")
    private String productName;

    @ManyToOne
    @JoinColumn(name = "brandID")
    private BrandEntity brand;

    @ManyToOne
    @JoinColumn(name = "typeID")
    private TypeEntity type;

    @ManyToOne
    @JoinColumn(name = "categoryID")
    private CategoryEntity category;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private List<ImageEntity> images;

    @OneToMany(mappedBy = "product")
    private List<OrderDetailEntity> orderDetails;

    @OneToOne(cascade = {CascadeType.ALL})
    @PrimaryKeyJoinColumn
    private ProductDetailEntity productDetail;

    public ProductEntity() {
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }


    public BrandEntity getBrand() {
        return brand;
    }

    public void setBrand(BrandEntity brand) {
        this.brand = brand;
    }

    public TypeEntity getType() {
        return type;
    }

    public void setType(TypeEntity type) {
        this.type = type;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

    public List<OrderDetailEntity> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetailEntity> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public ProductDetailEntity getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetailEntity productDetail) {
        this.productDetail = productDetail;
    }
}
