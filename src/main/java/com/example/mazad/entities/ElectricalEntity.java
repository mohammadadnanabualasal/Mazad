package com.example.mazad.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "ELECTRICALS", schema = "Mazad", catalog = "")
public class ElectricalEntity extends ItemEntity{
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "device_condition")
    private int DeviceCondition ;
    @Basic
    @Column(name = "electrical_type_id ")
    private int ElectricalTypeId ;
    @Basic
    @Column(name = "ad_id")
    private int adId;

    public static final int adTypeId = 2;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDeviceCondition() {
        return DeviceCondition;
    }

    public void setDeviceCondition(int DeviceCondition) {
        this.DeviceCondition = DeviceCondition;
    }

    public int getElectricalTypeId() {
        return ElectricalTypeId;
    }

    public void setElectricalTypeId(int ElectricalTypeId ) {
        this.ElectricalTypeId = ElectricalTypeId;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public static ElectricalEntity getElectricalById(String id)
    {
        ElectricalEntity electrical = null;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query =  entityManager.createNativeQuery("SELECT * FROM ELECTRICALS where id="+id+";", ElectricalEntity.class);
            electrical = (ElectricalEntity) query.getResultList().get(0);
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            return null;
        }
        return electrical;

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ElectricalEntity that = (ElectricalEntity) o;
        return id == that.id &&  DeviceCondition == that.DeviceCondition &&  ElectricalTypeId == that.ElectricalTypeId &&  adId == that.adId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, DeviceCondition, ElectricalTypeId, adId);
    }

    public static List<ElectricalEntity> getAllElectricals() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<ElectricalEntity> electrical = new ArrayList<>();
        Query query = entityManager.createNativeQuery("SELECT * FROM  ELECTRICALS WHERE ad_id in (select id from ADS where is_active=1);", ElectricalEntity.class);
        electrical = query.getResultList();
        entityManager.close();
        entityManagerFactory.close();
        return electrical;
    }
}
