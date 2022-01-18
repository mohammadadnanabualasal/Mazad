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
    public ModelAndView getCarsPage()
    {
        ModelAndView modelAndView = new ModelAndView("model");
        modelAndView.setViewName("addElectricals");
        return modelAndView;
    }

    @GetMapping(value = "/addElectricals")
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


}
