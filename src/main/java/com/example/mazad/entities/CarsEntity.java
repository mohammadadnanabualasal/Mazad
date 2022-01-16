package com.example.mazad.entities;

import javax.persistence.*;
import javax.persistence.Entity;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "CARS", schema = "Mazad", catalog = "")
public class CarsEntity extends ItemEntity{


    @Id
    @Column(name = "id")
    int id;
    @Basic
    @Column(name = "model")
    String model;
    @Basic
    @Column(name = "kilometers")
    private int kilometers;
    @Basic
    @Column(name = "color")
    private String color;
    @Basic
    @Column(name = "year")
    private int year;
    @Basic
    @Column(name = "car_maker")
    private String carMaker;
    @Basic
    @Column(name = "car_condition")
    private int carCondition;
    @Basic
    @Column(name = "transmission_type")
    private int transmissionType;
    @Basic
    @Column(name = "fuel_type")
    private int fuelType;
    @Basic
    @Column(name = "ad_id")
    private int adId;


    public static List<CarsEntity> getAllCars() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<CarsEntity> cars = new ArrayList<>();
        Query query = entityManager.createNativeQuery("SELECT * FROM " + "CARS" + ";", CarsEntity.class);
        cars = query.getResultList();
        entityManager.close();
        entityManagerFactory.close();
        return cars;
    }

    public static List<AdsEntity> getAllAdsOfCars() {
        List<AdsEntity> adsEntities = new ArrayList<>();
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNativeQuery("SELECT ADS.* FROM ADS inner join CARS ON ADS.ad_id=CARS.ad_id AND ADS.is_active=1;", AdsEntity.class);
        adsEntities = query.getResultList();
        entityManager.close();
        entityManagerFactory.close();
        return adsEntities;

    }

    public static long saveNewCarInDB(CarsEntity car) {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(car);
            transaction.commit();
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            return -1;
        }
            return car.getId();

        }

    public int getId() {
        return id;
    }

    public void setId(int car_id) {
        this.id = car_id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getCar_maker() {
        return carMaker;
    }

    public void setCar_maker(String car_maker) {
        this.carMaker = car_maker;
    }

    public int getCar_condition() {
        return carCondition;
    }

    public void setCar_condition(int car_condition) {
        this.carCondition = car_condition;
    }

    public int getKilometers() {
        return kilometers;
    }

    public void setKilometers(int kilometers) {
        this.kilometers = kilometers;
    }

    public int getTransmission_type() {
        return transmissionType;
    }

    public void setTransmission_type(int transmission_type) {
        this.transmissionType = transmission_type;
    }

    public int getFuel_type() {
        return fuelType;
    }

    public void setFuel_type(int fuel_type) {
        this.fuelType = fuel_type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getAd_id() {
        return adId;
    }

    public void setAd_id(int ad_id) {
        this.adId = ad_id;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public AdsEntity getRelatedAdd() {
        AdsEntity adsEntity;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createNativeQuery("SELECT * FROM  ADS WHERE id=" + this.getAd_id() + ";", AdsEntity.class);
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

    public String getCarMaker() {
        return carMaker;
    }

    public void setCarMaker(String carMaker) {
        this.carMaker = carMaker;
    }

    public int getCarCondition() {
        return carCondition;
    }

    public void setCarCondition(int carCondition) {
        this.carCondition = carCondition;
    }

    public int getTransmissionType() {
        return transmissionType;
    }

    public void setTransmissionType(int transmissionType) {
        this.transmissionType = transmissionType;
    }

    public int getFuelType() {
        return fuelType;
    }

    public void setFuelType(int fuelType) {
        this.fuelType = fuelType;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CarsEntity that = (CarsEntity) o;
        return id == that.id && kilometers == that.kilometers && year == that.year && carCondition == that.carCondition && transmissionType == that.transmissionType && fuelType == that.fuelType && adId == that.adId && Objects.equals(model, that.model) && Objects.equals(color, that.color) && Objects.equals(carMaker, that.carMaker);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, model, carMaker, carCondition, kilometers, transmissionType, fuelType, color, adId, year);
    }
}