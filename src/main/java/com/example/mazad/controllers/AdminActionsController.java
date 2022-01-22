package com.example.mazad.controllers;

import com.example.mazad.entities.AdsEntity;
import com.example.mazad.entities.ItemEntity;
import com.example.mazad.entities.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class AdminActionsController {

    @GetMapping(value = "/action/inactiveAds")
    public ModelAndView getAllInactiveAds(HttpSession session)
    {
        UsersEntity user = (UsersEntity) session.getAttribute("user");
        if (user == null || user.getUserType() != 2)
        {
            return new ModelAndView("notAdmin");
        }

        ModelAndView modelAndView = new ModelAndView("inactiveAds");
        modelAndView.addObject("entities", ItemEntity.getAllActiveCars());
        return modelAndView;
    }

    @GetMapping(value = "/action/enableAd/{tableName}/{id}")
    public ModelAndView enableAd(HttpSession session, @PathVariable(name = "id") String id, @PathVariable(name = "tableName") String tableName)
    {
        UsersEntity user = (UsersEntity) session.getAttribute("user");
        if (user == null || user.getUserType() != 2)
        {
            return new ModelAndView("notAdmin");
        }

        AdsEntity.enableAd(ItemEntity.getEntityById(id, Integer.parseInt(tableName)).getRelatedAdd().getId()+"");
        ModelAndView modelAndView = new ModelAndView("redirect:/action/inactiveAds");
        modelAndView.addObject("entities", ItemEntity.getAllActiveCars());
        return modelAndView;
    }

    @GetMapping(value = "/action/deleteAd/{typeId}/{id}")
    public ModelAndView deleteAd(HttpSession session, @PathVariable(name = "id") String id, @PathVariable(name = "typeId") String typeId)
    {
        UsersEntity user = (UsersEntity) session.getAttribute("user");
        if (user == null || user.getUserType() != 2)
        {
            return new ModelAndView("notAdmin");
        }

        ItemEntity.getEntityById(id, Integer.parseInt(typeId)).getRelatedAdd().deleteEntity();
        ItemEntity.getEntityById(id, Integer.parseInt(typeId)).deleteEntity();
        ModelAndView modelAndView = new ModelAndView("redirect:/action/inactiveAds");
        modelAndView.addObject("entities", ItemEntity.getAllActiveCars());
        return modelAndView;
    }

    @GetMapping(value = "/action/adminTools")
    public ModelAndView adminToolsPage(HttpSession session)
    {
        UsersEntity user = (UsersEntity) session.getAttribute("user");
        if (user == null || user.getUserType() != 2)
        {
            return new ModelAndView("notAdmin");
        }
        ModelAndView modelAndView = new ModelAndView("adminTools");
        modelAndView.addObject("entities", ItemEntity.getAllActiveCars());
        return modelAndView;
    }
}
