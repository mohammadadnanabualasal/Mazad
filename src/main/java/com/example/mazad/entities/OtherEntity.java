package com.example.mazad.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "OTHER_ITEMS", schema = "Mazad", catalog = "")
public class OtherEntity extends ItemEntity{
    @Id
    @Column(name = "id")
    private int id;
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

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public static OtherEntity getOtherById(String id)
    {
        OtherEntity other = null;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query =  entityManager.createNativeQuery("SELECT * FROM OTHER_ITEMS where id="+id+";", OtherEntity.class);
            other = (OtherEntity) query.getResultList().get(0);
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            return null;
        }
        return other;

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OtherEntity that = (OtherEntity) o;
        return id == that.id  && adId == that.adId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, adId);
    }

    public static List<OtherEntity> getAllothers() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<OtherEntity> others = new ArrayList<>();
        Query query = entityManager.createNativeQuery("SELECT * FROM  OTHER_ITEMS" + ";", OtherEntity.class);
        others = query.getResultList();
        entityManager.close();
        entityManagerFactory.close();
        return others;
    }
}
