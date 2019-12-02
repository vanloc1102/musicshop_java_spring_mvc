package com.spring.musicshop.entities;

import java.io.Serializable;
import org.springframework.web.multipart.MultipartFile;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "customer")
public class CustomerEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customerID")
    private int customerID;

    @Column(name = "email")
    private String email; 

    @Column(name = "customerImg")
    private String customerImg;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;   

    @OneToMany(mappedBy = "customer")
    private List<OrderEntity> orderList;

    @OneToOne(cascade = {CascadeType.ALL})
    @PrimaryKeyJoinColumn
    private CustomerProfileEntity customerProfile;
    
    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "accountID")
    private AccountEntity account;

    @Transient
    private MultipartFile fileData;

    public CustomerEntity() {
    }

    public MultipartFile getFileData() {
        return fileData;
    }

    public void setFileData(MultipartFile fileData) {
        this.fileData = fileData;
    }

    public String getCustomerImg() {
        return customerImg;
    }

    public void setCustomerImg(String customerImg) {
        this.customerImg = customerImg;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<OrderEntity> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<OrderEntity> orderList) {
        this.orderList = orderList;
    }

    public CustomerProfileEntity getCustomerProfile() {
        return customerProfile;
    }

    public void setCustomerProfile(CustomerProfileEntity customerProfile) {
        this.customerProfile = customerProfile;
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

    public AccountEntity getAccount() {
        return account;
    }

    public void setAccount(AccountEntity account) {
        this.account = account;
    }
    
}
