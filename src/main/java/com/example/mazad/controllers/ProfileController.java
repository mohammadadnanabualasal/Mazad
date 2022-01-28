package com.example.mazad.controllers;

import com.example.mazad.entities.ItemEntity;
import com.example.mazad.entities.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

@Controller
public class ProfileController {

    @RequestMapping(value = "/profile")
    public ModelAndView getProfilePage(HttpSession session)
    {
        if (session.getAttribute("user") != null)
        {
            ModelAndView model = new ModelAndView("profile");
            model.addObject("ads", ItemEntity.getAllAdsOfUser(((UsersEntity)session.getAttribute("user")).getId()+"",false));
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
        model.addObject("ads", ItemEntity.getAllAdsOfUser(id,true));
        model.addObject("userProfile", UsersEntity.getUserById(id));
        return model;

    }

    @RequestMapping(value = "/addProfilePicture", method = RequestMethod.POST)
    public ModelAndView changeProfilePage(HttpSession session, HttpServletRequest request)
    {
        if (session.getAttribute("user") != null){
            try {
                saveProfileImage(request.getParts(), (UsersEntity) session.getAttribute("user"));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return new ModelAndView("redirect:/profile");

    }

    public void saveProfileImage(Collection<Part> parts, UsersEntity user)
    {
        try {
            for (Part p: parts) {
                if (p.getContentType() != null && p.getContentType().startsWith("image")){
                    InputStream imageInputStream = p.getInputStream();
                    File folder = new File(System.getProperty("user.home") + "/MazadImages/profileImages" );
                    File file = new File(folder.getAbsolutePath()+"/"+user.getId()+"."+p.getContentType().substring(p.getContentType().indexOf('/')+1));
                    file.createNewFile();
                    UtilesController.copyInputStreamToFile(imageInputStream, file);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
