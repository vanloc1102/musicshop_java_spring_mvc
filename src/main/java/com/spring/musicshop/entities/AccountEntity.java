/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "account")
public class AccountEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String username;
    private String password;
    
    @Column(name = "isEnabled")
    private boolean isEnabled;

    @ManyToMany(cascade = {CascadeType.PERSIST,
        CascadeType.MERGE}, fetch = FetchType.LAZY)
    @JoinTable(name = "acc_role_relationship",
            joinColumns = @JoinColumn(name = "acc_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "acc_role_id",
                    referencedColumnName = "id"))
    private List<AccountRoleEntity> accountRoles;
    
    @OneToOne(mappedBy = "account")
    private CustomerEntity customer;

    public AccountEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<AccountRoleEntity> getAccountRoles() {
        return accountRoles;
    }

    public void setAccountRoles(List<AccountRoleEntity> accountRoles) {
        this.accountRoles = accountRoles;
    }
    
    public boolean isIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

}
