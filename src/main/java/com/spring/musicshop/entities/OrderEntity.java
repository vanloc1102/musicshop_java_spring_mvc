package com.spring.musicshop.entities;

import java.io.Serializable;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "productOrder")
public class OrderEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderID")
    private int orderID;

    @Column(name = "orderDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date orderDate;

    @Column(name = "orderStatus")
    private String orderStatus;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "zip")
    private int zip;

    @Column(name = "state")
    private String state;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private int phone;

    @Column(name = "email")
    private String email;

    @Column(name = "checkoutCode")
    private String checkoutCode;

    @Column(name = "isDeleted")
    private boolean isDeleted;

    @Column(name = "totalPrice")
    private double totalPrice;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    private List<OrderDetailEntity> orderDetailList;

    @ManyToOne
    @JoinColumn(name = "customerID")
    private CustomerEntity customer;

    public OrderEntity() {
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getZip() {
        return zip;
    }

    public void setZip(int zip) {
        this.zip = zip;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public List<OrderDetailEntity> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetailEntity> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCheckoutCode() {
        return checkoutCode;
    }

    public void setCheckoutCode(String checkoutCode) {
        this.checkoutCode = checkoutCode;
    }
}
