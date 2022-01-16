package com.example.mazad.entities;

import javax.persistence.*;
import javax.persistence.Entity;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "ADS", schema = "Mazad", catalog = "")
public class AdsEntity extends ItemEntity{
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "title")
    private String title;
    @Basic
    @Column(name = "initial_price")
    private Double initialPrice;
    @Basic
    @Column(name = "ad_description")
    private String adDescription;
    @Basic
    @Column(name = "last_price")
    private Double lastPrice;
    @Basic
    @Column(name = "last_buyer_user_id")
    private Integer lastBuyerUserId;
    @Basic
    @Column(name = "type_id")
    private int typeId;
    @Basic
    @Column(name = "ad_owner_user_id")
    private int adOwnerUserId;
    @Basic
    @Column(name = "is_active")
    private boolean isActive;
    @Basic
    @Column(name = "country")
    private String country;
    @Basic
    @Column(name = "city")
    private String city;


    public static long saveNewAdInDB(AdsEntity ad) {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(ad);
            transaction.commit();
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            return -1;
        }
        return ad.getId();

    }

    public int getId() {
        return id;
    }

    public void setId(int adId) {
        this.id = adId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getInitialPrice() {
        return initialPrice;
    }

    public void setInitialPrice(Double initialPrice) {
        this.initialPrice = initialPrice;
    }

    public String getAdDescription() {
        return adDescription;
    }

    public void setAdDescription(String adDescription) {
        this.adDescription = adDescription;
    }

    public Double getLastPrice() {
        return lastPrice;
    }

    public void setLastPrice(Double lastPrice) {
        this.lastPrice = lastPrice;
    }

    public Integer getLastBuyerUserId() {
        return lastBuyerUserId;
    }

    public void setLastBuyerUserId(Integer lastBuyerUserId) {
        this.lastBuyerUserId = lastBuyerUserId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getAdOwnerUserId() {
        return adOwnerUserId;
    }

    public void setAdOwnerUserId(int adOwnerUserId) {
        this.adOwnerUserId = adOwnerUserId;
    }

    public boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdsEntity adsEntity = (AdsEntity) o;
        return id == adsEntity.id && typeId == adsEntity.typeId && adOwnerUserId == adsEntity.adOwnerUserId && isActive == adsEntity.isActive && Objects.equals(title, adsEntity.title) && Objects.equals(initialPrice, adsEntity.initialPrice) && Objects.equals(adDescription, adsEntity.adDescription) && Objects.equals(lastPrice, adsEntity.lastPrice) && Objects.equals(lastBuyerUserId, adsEntity.lastBuyerUserId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, initialPrice, adDescription, lastPrice, lastBuyerUserId, typeId, adOwnerUserId, isActive);
    }

    public List<String> getImagesPaths()
    {
        List<String> paths = new ArrayList<>();

        File folder = new File(System.getProperty("user.home") + "/MazadImages" + "/" + getTypeId() + "/" + getId() + "/" );
        File[] listOfFiles = folder.listFiles();

        if(listOfFiles != null)
        for (int i = 0; i < listOfFiles.length; i++) {
            if (listOfFiles[i].isFile()) {
                paths.add("/image/"+ getTypeId() + "/" + getId() + "/"+listOfFiles[i].getName());
            }
        }
        if (paths.isEmpty())
        {
            paths.add("/image/0/0/default-image.png");
        }
        return paths;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

}
