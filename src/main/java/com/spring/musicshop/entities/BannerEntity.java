package com.spring.musicshop.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "banner")
public class BannerEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bannerID")
    private int bannerID;

    @Column(name = "bannerName")
    private String bannerName;

    @Column(name = "bannerURL")
    private String bannerURL;

    @Column(name = "bannerTitle")
    private String bannerTitle;

    @Column(name = "bannerContent")
    private String bannerContent;

    @Column(name = "bannerDir")
    private String bannerDir;

    public BannerEntity() {
    }

    public int getBannerID() {
        return bannerID;
    }

    public void setBannerID(int bannerID) {
        this.bannerID = bannerID;
    }

    public String getBannerName() {
        return bannerName;
    }

    public void setBannerName(String bannerName) {
        this.bannerName = bannerName;
    }

    public String getBannerURL() {
        return bannerURL;
    }

    public void setBannerURL(String bannerURL) {
        this.bannerURL = bannerURL;
    }

    public String getBannerTitle() {
        return bannerTitle;
    }

    public void setBannerTitle(String bannerTitle) {
        this.bannerTitle = bannerTitle;
    }

    public String getBannerContent() {
        return bannerContent;
    }

    public void setBannerContent(String bannerContent) {
        this.bannerContent = bannerContent;
    }

    public String getBannerDir() {
        return bannerDir;
    }

    public void setBannerDir(String bannerDir) {
        this.bannerDir = bannerDir;
    }
}
