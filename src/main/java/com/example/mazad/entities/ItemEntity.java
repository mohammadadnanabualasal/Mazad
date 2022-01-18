package com.example.mazad.entities;

import javax.persistence.*;

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
}
