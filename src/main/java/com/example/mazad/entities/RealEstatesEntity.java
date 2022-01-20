package com.example.mazad.entities;

        import javax.persistence.*;
        import java.util.ArrayList;
        import java.util.List;
        import java.util.Objects;

@Entity
@Table(name = "REAL_ESTATES", schema = "Mazad", catalog = "")
public class RealEstatesEntity extends ItemEntity{
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "real_state_type_id")
    private int realStateTypeId;

    @Override
    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    @Basic
    @Column(name = "ad_id")
    private int adId;

    public static final int realStateTypeTypeId = 5;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRealStateTypeId() {
        return realStateTypeId;
    }

    public void setRealStateTypeId(int adId) {
        this.realStateTypeId = adId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RealEstatesEntity that = (RealEstatesEntity) o;
        return id == that.id  && realStateTypeId == that.realStateTypeId  && adId == that.adId ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, realStateTypeId);
    }

    public static List<RealEstatesEntity> getAllreal_Estates() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        List<RealEstatesEntity> realEstates = new ArrayList<>();
        Query query = entityManager.createNativeQuery("SELECT * FROM  REAL_ESTATES" + ";", RealEstatesEntity.class);
        realEstates = query.getResultList();
        entityManager.close();
        entityManagerFactory.close();
        return realEstates;
    }
}