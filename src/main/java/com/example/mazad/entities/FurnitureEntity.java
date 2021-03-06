package com.example.mazad.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "FURNITURE", schema = "Mazad", catalog = "")
public class FurnitureEntity extends ItemEntity{
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "furniture_condition")
    private int furnitureCondition;
    @Basic
    @Column(name = "ad_id")
    private int adId;

    public static final int adTypeId = 3;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFurnitureCondition() {
        return furnitureCondition;
    }

    public void setFurnitureCondition(int furnitureCondition) {
        this.furnitureCondition = furnitureCondition;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public static FurnitureEntity getFurnitureById(String id)
    {
        FurnitureEntity furniture = null;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query =  entityManager.createNativeQuery("SELECT * FROM FURNITURE where id="+id+";", FurnitureEntity.class);
            furniture = (FurnitureEntity) query.getResultList().get(0);
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            return null;
        }
        return furniture;

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FurnitureEntity that = (FurnitureEntity) o;
        return id == that.id && furnitureCondition == that.furnitureCondition && adId == that.adId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, furnitureCondition, adId);
    }

    public static List<FurnitureEntity> getAllFurnitures() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<FurnitureEntity> furnitures = new ArrayList<>();
        Query query = entityManager.createNativeQuery("SELECT * FROM  FURNITURE WHERE ad_id in (SELECT id FROM ADS WHERE is_active = 1);", FurnitureEntity.class);
        furnitures = query.getResultList();
        entityManager.close();
        entityManagerFactory.close();
        return furnitures;
    }
}
