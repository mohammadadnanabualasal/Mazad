package com.example.mazad.controllers;

import com.example.mazad.DBConnection.MysqlCon;
import com.example.mazad.entities.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.HashMap;
import java.util.Map;

@Controller
public class Home {
    private static final Logger logger = LoggerFactory.getLogger(Home.class);


    @GetMapping(value={"/home", "/"} )
    public ModelAndView getHomePage(Model model)
    {
        ModelAndView modelAndView = new ModelAndView();
        int x = MysqlCon.getRowsCount("SELECT * FROM CARS;");
        model.addAttribute("adsCount", getNumberOfAds());
        modelAndView.addObject("model",model);
        modelAndView.setViewName("home");
        return modelAndView;
    }

    public Map<String, String> getNumberOfAds()
    {
        Map<String, String> ads = new HashMap<>();

        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createNativeQuery("SELECT * FROM CARS");
            int cars = CarsEntity.getAllCars().size();
            ads.put("cars",cars+"");
            int furniture = FurnitureEntity.getAllFurnitures().size();
            ads.put("furniture",furniture+"");
            int electricals = ElectricalEntity.getAllElectricals().size();
            ads.put("electricals",electricals+"");
            int realEstates = RealEstatesEntity.getAllreal_Estates().size();
            ads.put("realEstates",realEstates+"");
            int others = OtherEntity.getAllothers().size();
            ads.put("others",others+"");
        }catch (Exception exception)
        {
            return ads;
        }
        return ads;
    }

}
