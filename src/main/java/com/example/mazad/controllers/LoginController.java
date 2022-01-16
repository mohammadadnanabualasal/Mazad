package com.example.mazad.controllers;


import com.example.mazad.entities.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public ModelAndView getLoginPage(HttpSession session) {
      if(session.getAttribute("user") != null)
      {
          return new ModelAndView("redirect:/home");
      }
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.addObject("msg", "Please Enter Your Login Details");
      modelAndView.setViewName("login");
      return modelAndView;
  }
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session) {
        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
            return new ModelAndView("redirect:/home");
        }
        else {
                return new ModelAndView("redirect:/login");

        }

    }

  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public ModelAndView submit(@RequestParam(name = "userName") String email, @RequestParam(name = "password") String password, HttpSession session) {
      if(session.getAttribute("user") != null)
      {
          return new ModelAndView("redirect:/home");
      }
      ModelAndView modelAndView = new ModelAndView();
      if (!email.isEmpty() && !password.isEmpty()) {
          UsersEntity user = UsersEntity.getUser(email);
          if (user != null && password.equals(user.getPassword())) {
              modelAndView.addObject("user", user);
              session.setAttribute("user", user);
              return new ModelAndView("redirect:/home");
          } else {
              modelAndView.addObject("error", "Invalid Details");
              modelAndView.setViewName("login");
              return modelAndView;
          }
      } else {
          modelAndView.addObject("error", "Please enter Details");
          modelAndView.setViewName("login");
          return modelAndView;
      }
  }


}
