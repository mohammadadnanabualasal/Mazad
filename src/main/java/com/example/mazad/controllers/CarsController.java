package com.example.mazad.controllers;

import com.example.mazad.AppConfiguration;
import com.example.mazad.entities.AdsEntity;
import com.example.mazad.entities.CarsEntity;
import com.example.mazad.entities.ItemEntity;
import com.example.mazad.entities.UsersEntity;
import org.hibernate.Transaction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class CarsController {

    @GetMapping(value = "/cars")
    public ModelAndView getCarsPage(Model model)
    {
        ModelAndView modelAndView = new ModelAndView("model");
        model.addAttribute("cars", CarsEntity.getAllCars());
        modelAndView.addObject("model",model);
        modelAndView.setViewName("cars");
        return modelAndView;
    }

    @GetMapping(value = "/addCar")
    public ModelAndView getAddCarPage(Model model, HttpSession session)
    {
        if(session.getAttribute("user") == null)
        {
            return new ModelAndView("redirect:/login");
        }
        ModelAndView modelAndView = new ModelAndView("model");
        modelAndView.addObject("model",model);
        modelAndView.setViewName("addCar");
        return modelAndView;
    }

    @GetMapping(value = "/car/{carId}")
    public ModelAndView getCarEntityPage(@PathVariable("carId") String id)
    {
        ModelAndView modelAndView = new ModelAndView("model");
        modelAndView.addObject("car", CarsEntity.getCarById(id));
        modelAndView.setViewName("car");
        return modelAndView;
    }

    @RequestMapping(value = "/action/addCar", method = RequestMethod.POST)
    public ModelAndView submit(Model model, HttpSession session, HttpServletRequest request)
    {
        if(session.getAttribute("user") == null)
        {
            return new ModelAndView("redirect:/login");
        }
        Map<String, String[]> parameterMap = request.getParameterMap();
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();

        CarsEntity car = new CarsEntity();
        AdsEntity adsEntity = new AdsEntity();

        int adId = ItemEntity.getGreaterIdOfTable("ADS")+1;
        adsEntity.setId(adId);
        adsEntity.setTitle(parameterMap.get("title")[0]);
        adsEntity.setInitialPrice(Double.parseDouble(parameterMap.get("initialPrice")[0].toString()));
        adsEntity.setAdDescription(parameterMap.get("description")[0]);
        adsEntity.setCity(AppConfiguration.messageSource().getMessage("location.city."+parameterMap.get("location")[0],null,null));
        adsEntity.setCountry("Jordan");
        adsEntity.setLastPrice(Double.parseDouble(parameterMap.get("initialPrice")[0]));
        adsEntity.setLastBuyerUserId(null);
        adsEntity.setTypeId(CarsEntity.adTypeId);
        adsEntity.setAdOwnerUserId(((UsersEntity)session.getAttribute("user")).getId());
        adsEntity.setIsActive(false);
        entityManager.persist(adsEntity);
        transaction.commit();



        car.setId(ItemEntity.getGreaterIdOfTable("CARS")+1);
        car.setModel(parameterMap.get("carModel")[0].toString());
        car.setCar_maker(AppConfiguration.messageSource().getMessage("addCar.maker."+parameterMap.get("carMaker")[0],null,null));
        car.setCar_condition(Integer.parseInt(parameterMap.get("condition")[0]));
        car.setKilometers(Integer.parseInt(parameterMap.get("kilometers")[0]));
        car.setTransmission_type(Integer.parseInt(parameterMap.get("transType")[0]));
        car.setFuel_type(Integer.parseInt(parameterMap.get("fuelType")[0]));
        car.setColor(parameterMap.get("color")[0]);
        car.setAdId(adId);
        car.setYear(Integer.parseInt(parameterMap.get("year")[0]));
        EntityTransaction transaction2 = entityManager.getTransaction();
        transaction2.begin();
        entityManager.persist(car);
        transaction2.commit();
        entityManager.close();
        entityManagerFactory.close();

        try {
            adsEntity.saveImage(request.getParts());
        }catch (Exception e)
        {
            e.printStackTrace();
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/cars");
        return modelAndView;
    }
}
