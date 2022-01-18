package com.example.mazad.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

@Controller
public class OtherThingsController {

    @GetMapping(value = "/addOthers")
    public ModelAndView getOtherThingsPage()
    {
        return new ModelAndView("addOtherThings");
    }

    @RequestMapping(value = "/addOthers",  method = RequestMethod.POST)
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
