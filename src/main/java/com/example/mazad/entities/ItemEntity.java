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
        return (int) query.getResultList().get(0);
    }
}
