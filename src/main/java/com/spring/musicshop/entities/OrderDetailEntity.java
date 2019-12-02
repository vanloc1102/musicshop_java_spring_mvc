package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "productOrderDetail")
public class OrderDetailEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderDetailID")
    private int orderDetailID;

    @Column(name = "orderDetailQuantity")
    private int orderDetailQuantity;
    
    @Column(name = "total_price")
    private double totalPrice;

    @ManyToOne
    @JoinColumn(name = "productID")
    private ProductEntity product;

    @ManyToOne
    @JoinColumn(name = "orderID")
    private OrderEntity order;

    public OrderDetailEntity() {
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderDetailQuantity() {
        return orderDetailQuantity;
    }

    public void setOrderDetailQuantity(int orderDetailQuantity) {
        this.orderDetailQuantity = orderDetailQuantity;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public OrderEntity getOrder() {
        return order;
    }

    public void setOrder(OrderEntity order) {
        this.order = order;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}
