package com.example.mazad.controllers;

import com.example.mazad.DBConnection.MysqlCon;
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
            int cars =  query.getResultList().size();
            ads.put("cars",cars+"");
            query = entityManager.createNativeQuery("SELECT * FROM FURNITURE");
            int furniture =  query.getResultList().size();
            ads.put("furniture",furniture+"");
            query = entityManager.createNativeQuery("SELECT * FROM ELECTRICALS");
            int electricals =  query.getResultList().size();
            ads.put("electricals",electricals+"");
            query = entityManager.createNativeQuery("SELECT * FROM REAL_ESTATES");
            int realEstates =  query.getResultList().size();
            ads.put("realEstates",realEstates+"");
            query = entityManager.createNativeQuery("SELECT * FROM OTHER_ITEMS");
            int others =  query.getResultList().size();
            ads.put("others",others+"");
            entityManager.close();
            entityManagerFactory.close();
        }catch (Exception exception)
        {
            return ads;
        }
        return ads;
    }

}
