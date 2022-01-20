package com.example.mazad.controllers;

import com.example.mazad.entities.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ProfileController {

    @RequestMapping(value = "/profile")
    public ModelAndView getProfilePage(HttpSession session)
    {
        if (session.getAttribute("user") != null)
        {
            ModelAndView model = new ModelAndView("profile");
            model.addObject("userProfile",session.getAttribute("user"));
            return model;

        }else {
            return new ModelAndView("redirect:login");
        }

    }

    @RequestMapping(value = "/profile/{id}")
    public ModelAndView getProfilePage(@PathVariable(name = "id") String id)
    {
        ModelAndView model = new ModelAndView("othersProfiles");
        model.addObject("userProfile", UsersEntity.getUserById(id));
        return model;

    }
}
