package com.example.mazad.controllers;

import com.example.mazad.entities.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.*;
import javax.servlet.http.HttpSession;

@Controller
public class  ElectricalsController {

    @RequestMapping(value = "/addElectrical", method = RequestMethod.GET)
    public ModelAndView getCreatePage(HttpSession session) {

        if (session.getAttribute("user") !=null)
        {
            return new ModelAndView("redirect:/addElectrical");
        }
        else
        {
            return new ModelAndView("Electricals");
        }
    }

    @RequestMapping(value = "/addElectrical",method = RequestMethod.POST)
    public ModelAndView createUser(HttpSession session, @RequestParam(name="title")String title,
                                   @RequestParam(name="location") String location, @RequestParam(name="condition") String condition,
                                   @RequestParam(name = "firstPrice") int firstPrice, @RequestParam(name="description") String description,
                                   @RequestParam(name = "images") String images){
        return new ModelAndView();
    }


}

