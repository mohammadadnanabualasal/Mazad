package com.example.mazad.controllers;

import com.example.mazad.entities.ItemEntity;
import com.example.mazad.entities.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.*;
import javax.servlet.http.HttpSession;

@Controller
public class RegistrationController {

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView getCreatePage(HttpSession session) {

    if (session.getAttribute("user") !=null)
    {
        return new ModelAndView("redirect:/home");
    }
    else
    {
        return new ModelAndView("create");
    }
    }

    @RequestMapping(value = "/create",method = RequestMethod.POST)
    public ModelAndView createUser(HttpSession session, @RequestParam(name="firstName")String firstName,
                                   @RequestParam(name="middleName") String middleName, @RequestParam(name="lastName") String lastName,
                                   @RequestParam(name = "email") String email, @RequestParam(name="password") String password,
                                   @RequestParam(name = "passwordConfirmation") String passwordConfirmation, @RequestParam(name="phoneNumber") long phoneNumber,
                                   @RequestParam(name = "creditCardId") long creditCardId, @RequestParam(name = "country") String country,
                                   @RequestParam(name = "city") String city){

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("mazad");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNativeQuery("SELECT * FROM USERS WHERE email = '"+email+"';");
        int users =  query.getResultList().size();
        entityManager.close();
        entityManagerFactory.close();
        UsersEntity usersEntity = new UsersEntity();
        usersEntity.setFirstName(firstName);
        usersEntity.setMiddleName(middleName);
        usersEntity.setLastName(lastName);
        usersEntity.setPassword(password);
        usersEntity.setEmail(email);
        usersEntity.setCreditCardId(creditCardId);
        usersEntity.setCountry(country);
        usersEntity.setCity(city);
        usersEntity.setPhoneNumber(phoneNumber);
        usersEntity.setId(ItemEntity.getGreaterIdOfTable("USERS"));

        if (session.getAttribute("user") !=null){
            return new ModelAndView("redirect:/home");
        }
        else {
            if (password.isEmpty() || passwordConfirmation.isEmpty() || !password.equals(passwordConfirmation)){
                ModelAndView modelAndView = new ModelAndView("create");
                modelAndView.addObject("usersEntity", usersEntity);
                modelAndView.addObject("error", "the password and confirm password doesn't match.");
                return modelAndView;

            }else if (users>0)
            {
                ModelAndView modelAndView = new ModelAndView("create");
                modelAndView.addObject("usersEntity", usersEntity);
                modelAndView.addObject("error","The email is already used.");
                return modelAndView;
            }
            boolean isSaved = false;

            try {
                isSaved = UsersEntity.saveNewUser(usersEntity);
            }catch (Exception e){
                ModelAndView modelAndView = new ModelAndView("create");
                modelAndView.addObject("usersEntity", usersEntity);
                return modelAndView;
            }
            if(isSaved)
            {
                session.setAttribute("user",usersEntity);
                return new ModelAndView("redirect:/home");
            }else {
                ModelAndView modelAndView = new ModelAndView("create");
                modelAndView.addObject("usersEntity", usersEntity);
                return modelAndView;
            }

        }
    }
}
