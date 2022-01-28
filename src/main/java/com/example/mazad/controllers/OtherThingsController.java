package com.example.mazad.controllers;

import com.example.mazad.entities.*;
import com.example.mazad.entities.AdsEntity;
import com.example.mazad.entities.ItemEntity;
import com.example.mazad.entities.UsersEntity;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.awt.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

@Controller
public class OtherThingsController {

    @GetMapping(value = "/addOthers")
    public ModelAndView getOtherThingsPage(HttpSession session)
    {
        if (session.getAttribute("user") == null)
        {
            return new ModelAndView("redirect:/login");
        }
        return new ModelAndView("addOtherThings");
    }
    @GetMapping(value = "/other/{otherId}")
    public ModelAndView getOtherEntityPage(@PathVariable("otherId") String id)
    {
        ModelAndView modelAndView = new ModelAndView("model");
        modelAndView.addObject("other", OtherEntity.getOtherById(id));
        modelAndView.setViewName("other");
        return modelAndView;
    }
    @RequestMapping(value = "/action/addOthers",method = RequestMethod.POST)
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
        ad.setTypeId(OtherEntity.adTypeId);
        ad.setIsActive(false);
        ad.setEndsAfter(Integer.parseInt(parameterMap.get("endsAfter")[0]));
        ItemEntity.saveNewEntityInDB(ad);

        OtherEntity other = new OtherEntity();
        other.setId(ItemEntity.getGreaterIdOfTable("OTHER_ITEMS")+1);
        other.setAdId(adId);
        ItemEntity.saveNewEntityInDB(other);
        try {
            ad.saveImage(request.getParts());
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return new ModelAndView("redirect:/others");
    }
    @GetMapping(value = "/others")
    public ModelAndView getOtherThingsPage( )
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("others", OtherEntity.getAllothers());
        modelAndView.setViewName("others");
        return modelAndView;
    }


}
