package com.example.mazad.DBConnection;

import com.example.mazad.entities.ItemEntity;

import javax.persistence.PostPersist;

public class SomeLinstener {

    @PostPersist
    public void entityPostPersist(ItemEntity obj) {

        try {
            obj.getId();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}