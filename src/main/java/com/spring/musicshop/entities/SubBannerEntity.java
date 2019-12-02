/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author vanlo
 */
@Entity
@Table(name = "subbanner")
public class SubBannerEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "subbanerID")
    private int subbannerID;
    
    @Column(name = "subbannerTitle")
    private String subbannerTitle;
    
    @Column(name = "subbannerUrl")
    private String subbannerUrl;

    public SubBannerEntity() {
    }

    public int getSubbannerID() {
        return subbannerID;
    }

    public void setSubbannerID(int subbannerID) {
        this.subbannerID = subbannerID;
    }

    public String getSubbannerTitle() {
        return subbannerTitle;
    }

    public void setSubbannerTitle(String subbannerTitle) {
        this.subbannerTitle = subbannerTitle;
    }

    public String getSubbannerUrl() {
        return subbannerUrl;
    }

    public void setSubbannerUrl(String subbannerUrl) {
        this.subbannerUrl = subbannerUrl;
    }
        
}
