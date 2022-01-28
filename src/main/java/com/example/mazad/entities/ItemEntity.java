package com.example.mazad.entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

public class ItemEntity {

    public int getId()
    {
        return 0;
    }


    public static int getGreaterIdOfTable(String tableName)
    {
        String queryStatement = "SELECT MAX(id) FROM "+tableName+" LIMIT 1;";
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNativeQuery(queryStatement);
        return query.getResultList().get(0) != null? (int) query.getResultList().get(0):0;
    }

    public static long saveNewEntityInDB(ItemEntity entity) {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(entity);
            transaction.commit();
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            exception.printStackTrace();
            return -1;
        }
        return entity.getId();

    }
    public AdsEntity getRelatedAdd() {
        AdsEntity adsEntity;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createNativeQuery("SELECT * FROM  ADS WHERE id=" + this.getAdId() + ";", AdsEntity.class);
            adsEntity = (AdsEntity) query.getResultList().get(0);
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
        return adsEntity;
    }

    public int getAdId()
    {
        return -1;
    }

    public static List<ItemEntity> getAllActiveAds() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<ItemEntity> entities = new ArrayList<>();
        Query query = entityManager.createNativeQuery("SELECT * FROM CARS;", CarsEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT * FROM ELECTRICALS;", ElectricalEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT * FROM FURNITURE;", FurnitureEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT * FROM REAL_ESTATES;", RealEstatesEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT * FROM OTHER_ITEMS;", OtherEntity.class);
        entities.addAll(query.getResultList());
        entityManager.close();
        entityManagerFactory.close();
        List<ItemEntity> entities2 = new ArrayList<>();
        for (ItemEntity entity:entities
             ) {
            if (!entity.getRelatedAdd().getIsActive())
            {
                entities2.add(entity);
            }
        }
        return entities2;
    }

    public String getEntityUrl()
    {
        String path="";
        switch (getRelatedAdd().getTypeId()) {
            case CarsEntity.adTypeId:
                path +="/car/";
                break;
            case ElectricalEntity.adTypeId:
                path +="/electrical/";
                break;
            case FurnitureEntity.adTypeId:
                path +="/furniture/";
                break;
            case RealEstatesEntity.adTypeId:
                path +="/realEstate/";
                break;
            case OtherEntity.adTypeId:
                path +="/other/";
                break;
        }
        path += getId();
        return path;
    }

    public String getTableName()
    {
        String name="";
        switch (getId()) {
            case CarsEntity.adTypeId:
                name +="CARS";
                break;
            case ElectricalEntity.adTypeId:
                name +="ELECTRICALS";
                break;
            case FurnitureEntity.adTypeId:
                name +="FURNITURE";
                break;
            case RealEstatesEntity.adTypeId:
                name +="REAL_ESTATES";
                break;
            case OtherEntity.adTypeId:
                name +="OTHER_ITEMS";
                break;
        }
        return name;
    }

    public static ItemEntity getEntityById(String id, int typeId){
        ItemEntity entity = null;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = null;
            String tableName = "";
            switch (typeId) {
                case CarsEntity.adTypeId:
                    tableName +="CARS";
                    query =  entityManager.createNativeQuery("SELECT * FROM "+tableName+" where id="+id+";", CarsEntity.class);
                    entity = (ItemEntity) query.getResultList().get(0);
                    break;
                case ElectricalEntity.adTypeId:
                    tableName +="ELECTRICALS";
                    query =  entityManager.createNativeQuery("SELECT * FROM "+tableName+" where id="+id+";", ElectricalEntity.class);
                    entity = (ItemEntity) query.getResultList().get(0);
                    break;
                case FurnitureEntity.adTypeId:
                    tableName +="FURNITURE";
                    query =  entityManager.createNativeQuery("SELECT * FROM "+tableName+" where id="+id+";", FurnitureEntity.class);
                    entity = (ItemEntity) query.getResultList().get(0);
                    break;
                case RealEstatesEntity.adTypeId:
                    tableName +="REAL_ESTATES";
                    query =  entityManager.createNativeQuery("SELECT * FROM "+tableName+" where id="+id+";", RealEstatesEntity.class);
                    entity = (ItemEntity) query.getResultList().get(0);
                    break;
                case OtherEntity.adTypeId:
                    tableName +="OTHER_ITEMS";
                    query =  entityManager.createNativeQuery("SELECT * FROM "+tableName+" where id="+id+";", OtherEntity.class);
                    entity = (ItemEntity) query.getResultList().get(0);
                    break;
            }
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            exception.printStackTrace();
            return null;
        }
        return entity;
    }

    public boolean deleteEntity()
    {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.remove(entityManager.contains(this) ? this : entityManager.merge(this));
            transaction.commit();
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static List<ItemEntity> getAllAdsOfUser(String id, boolean active) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<ItemEntity> entities = new ArrayList<>();
        String isActive= active?" AND is_active=1 ":"";
        String where = "WHERE ad_id IN (SELECT id FROM ADS WHERE ad_owner_user_id = " + id + isActive+");";
        Query query = entityManager.createNativeQuery("SELECT CARS.* FROM CARS " + where, CarsEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT ELECTRICALS.* FROM ELECTRICALS " + where, ElectricalEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT FURNITURE.* FROM FURNITURE " + where, FurnitureEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT REAL_ESTATES.* FROM REAL_ESTATES " + where, RealEstatesEntity.class);
        entities.addAll(query.getResultList());
        query = entityManager.createNativeQuery("SELECT OTHER_ITEMS.* FROM OTHER_ITEMS " + where, OtherEntity.class);
        entities.addAll(query.getResultList());
        entityManager.close();
        entityManagerFactory.close();
        return entities;
    }

}
