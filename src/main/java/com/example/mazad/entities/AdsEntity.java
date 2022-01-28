package com.example.mazad.entities;

import com.example.mazad.controllers.UtilesController;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

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
    @Basic
    @Column(name = "activationDate")
    private Timestamp activationDate;
    @Basic
    @Column(name = "endsAfter")
    private int endsAfter;

    public static AdsEntity getEntityById(String id)
    {
        AdsEntity adsEntity;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createNativeQuery("SELECT * FROM  ADS WHERE id=" + id + ";", AdsEntity.class);
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

    public static boolean updateAd(AdsEntity a)
    {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.merge(a);
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

    public static boolean enableAd(String adId)
    {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            AdsEntity ad = AdsEntity.getEntityById(adId);
            ad.setIsActive(true);
            ad.setActivationDate(new Timestamp(System.currentTimeMillis()));
            entityManager.merge(ad);
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

    public static boolean deleteAd(String adId)
    {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            AdsEntity ad = AdsEntity.getEntityById(adId);
            entityManager.remove(ad);
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

    public UsersEntity getOwnerUser()
    {
        UsersEntity usersEntity;
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createNativeQuery("SELECT * FROM  USERS WHERE id=" + this.getAdOwnerUserId() + ";", UsersEntity.class);
            usersEntity = (UsersEntity) query.getResultList().get(0);
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
        return usersEntity;
    }

    public void saveImage(Collection<Part> parts)
    {
        try {
            int c =1;
            for (Part p: parts) {
                if (p.getContentType() != null && p.getContentType().startsWith("image")){
                    InputStream imageInputStream = p.getInputStream();
                    File folder = new File(System.getProperty("user.home") + "/MazadImages" + "/" + this.getTypeId() + "/" + this.getId() + "/" );
                    folder.mkdirs();
                    File file = new File(folder.getAbsolutePath()+"/"+c+"."+p.getContentType().substring(p.getContentType().indexOf('/')+1));
                    file.createNewFile();
                    UtilesController.copyInputStreamToFile(imageInputStream, file);
                    c++;

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Timestamp getActivationDate() {
        return activationDate;
    }

    public void setActivationDate(Timestamp activationDate) {
        this.activationDate = activationDate;
    }

    public int getEndsAfter() {
        return endsAfter;
    }

    public void setEndsAfter(int endsAfter) {
        this.endsAfter = endsAfter;
    }

    public String endIn() {
        if (this.isActive){
            LocalDateTime to = getActivationDate().toLocalDateTime().plusDays(getEndsAfter());
            LocalDateTime from = (new Timestamp(System.currentTimeMillis())).toLocalDateTime();
            if(from.isAfter(to)){
                return "This AD has finished.";
            }
            LocalDateTime tempDateTime = LocalDateTime.from(from);
            long days = tempDateTime.until(to, ChronoUnit.DAYS);
            tempDateTime = tempDateTime.plusDays(days);
            long hours = tempDateTime.until(to, ChronoUnit.HOURS);
            tempDateTime = tempDateTime.plusHours(hours);

            long minutes = tempDateTime.until(to, ChronoUnit.MINUTES);
            String remainingTime = "This Ad End Within: "+days + " days " + hours + " hours " + minutes + " minutes.";
            return remainingTime;
        }else {return "This Ad is not active yet, the Admins will activate it soon.";}
    }
}
