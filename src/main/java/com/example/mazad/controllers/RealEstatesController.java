package com.example.mazad.controllers;

import com.example.mazad.entities.*;
import com.example.mazad.entities.AdsEntity;
import com.example.mazad.entities.ItemEntity;
import com.example.mazad.entities.UsersEntity;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
public class RealEstatesController {

    @GetMapping(value = "/addRealEstate")
    public ModelAndView getRealEstatesPage(HttpSession session)
    {
        if (session.getAttribute("user") == null)
        {
            return new ModelAndView("redirect:/login");
        }
        return new ModelAndView("addRealEstates");
    }
    @GetMapping(value = "/real-estates")
    public ModelAndView getRealEstatesPage( )
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("realEstates", RealEstatesEntity.getAllreal_Estates());
        modelAndView.setViewName("real_estates");
        return modelAndView;
    }

    @RequestMapping(value = "/action/addRealEstates",method = RequestMethod.POST)
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
        ad.setTypeId(RealEstatesEntity.realStateTypeTypeId);
        ad.setIsActive(false);
        ItemEntity.saveNewEntityInDB(ad);

        RealEstatesEntity realEstates = new RealEstatesEntity();
        realEstates.setId(ItemEntity.getGreaterIdOfTable("REAL_ESTATES")+1);
        realEstates.setRealStateTypeId(Integer.parseInt(parameterMap.get("RealEstateType")[0]));
        realEstates.setAdId(adId);
        ItemEntity.saveNewEntityInDB(realEstates);
        try {
            ad.saveImage(request.getParts());
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return new ModelAndView("redirect:/real-estates");
    }



}
