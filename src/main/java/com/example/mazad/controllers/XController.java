package com.example.mazad.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class XController {

    @GetMapping(value = "/x")
    public ModelAndView getX(){
        ModelAndView w= new ModelAndView();
        w.setViewName("x");
        w.addObject("c","najeh");
        return w;


    }

}
