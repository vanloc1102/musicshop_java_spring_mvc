package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "customerProfile")
public class CustomerProfileEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customerProfileID")
    private int customerProfileID;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "zip")
    private int zip;

    @Column(name = "state")
    private String state;

    @Column(name = "country")
    private String country;

    @Column(name = "phone")
    private int phone;

    @OneToOne(mappedBy = "customerProfile")
    private CustomerEntity customer;

    public CustomerProfileEntity() {
    }

    public int getCustomerProfileID() {
        return customerProfileID;
    }

    public void setCustomerProfileID(int customerProfileID) {
        this.customerProfileID = customerProfileID;
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }
}
