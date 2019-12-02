/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author vanlo
 */
@Entity
@Table(name = "ConfirmationToken")
public class ConfirmationTokenEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "token_id")
    private long tokenID;
    
    @Column(name = "confirmation_token")
    private String confirmationToken;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    
    @OneToOne(targetEntity = CustomerEntity.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "username")
    private CustomerEntity customer;

    public ConfirmationTokenEntity() {
    }

    public ConfirmationTokenEntity(CustomerEntity customer) {
        this.customer = customer;
        createDate = new Date();
        confirmationToken = UUID.randomUUID().toString();
    }

    public long getTokenID() {
        return tokenID;
    }

    public void setTokenID(long tokenID) {
        this.tokenID = tokenID;
    }

    public String getConfirmationToken() {
        return confirmationToken;
    }

    public void setConfirmationToken(String confirmationToken) {
        this.confirmationToken = confirmationToken;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }
    
}
