package com.example.mazad.controllers;

import com.example.mazad.AppConfiguration;
import com.example.mazad.entities.*;
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
public class ElectricalsController {

    @GetMapping(value = "/addElectrical")
    public ModelAndView getAddElectricalPage(HttpSession session)
    {
        if (session.getAttribute("user") == null)
        {
            return new ModelAndView("redirect:/login");
        }

        return new ModelAndView("addElectricals");
    }

    @GetMapping(value = "/electricals")
    public ModelAndView getElectricalsPage()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("electricals",ElectricalEntity.getAllElectricals());
        modelAndView.setViewName("electricals");
        return modelAndView;
    }
    @GetMapping(value = "/electrical/{electricalId}")
    public ModelAndView getElectricalEntityPage(@PathVariable("electricalId") String id)
    {
        ModelAndView modelAndView = new ModelAndView("model");
        modelAndView.addObject("electrical", ElectricalEntity.getElectricalById(id));
        modelAndView.setViewName("electrical");
        return modelAndView;
    }
    @RequestMapping(value = "/action/addElectricals",  method = RequestMethod.POST)
    public ModelAndView submit(HttpSession session, HttpServletRequest request)
    {
        if(session.getAttribute("user") == null)
        {
            return new ModelAndView("redirect:/login");
        }

        Map<String, String[]> parameterMap = request.getParameterMap();
        AdsEntity ad = new AdsEntity();
        int adId = ItemEntity.getGreaterIdOfTable("ADS") + 1;
        ad.setId(adId);
        ad.setTitle(parameterMap.get("title")[0]);
        ad.setAdDescription(parameterMap.get("description")[0]);
        ad.setCountry("Jordan");
        ad.setCity("location.city." + parameterMap.get("location")[0]);
        ad.setInitialPrice(Double.parseDouble(parameterMap.get("initialPrice")[0]));
        ad.setAdOwnerUserId(((UsersEntity)session.getAttribute("user")).getId());
        ad.setLastPrice(Double.parseDouble(parameterMap.get("initialPrice")[0]));
        ad.setLastBuyerUserId(null);
        ad.setTypeId(ElectricalEntity.adTypeId);
        ad.setIsActive(false);
        ItemEntity.saveNewEntityInDB(ad);

        ElectricalEntity electrical = new ElectricalEntity();
        electrical.setId(ItemEntity.getGreaterIdOfTable("ELECTRICALS")+1);
        electrical.setAdId(adId);
        electrical.setDeviceCondition(Integer.parseInt(parameterMap.get("condition")[0]));
        ItemEntity.saveNewEntityInDB(electrical);
        try {
            ad.saveImage(request.getParts());
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return new ModelAndView("redirect:/electricals");
    }




}
