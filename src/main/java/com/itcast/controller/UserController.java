package com.itcast.controller;

import com.itcast.model.User;
import com.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private HttpServletRequest request;


    @RequestMapping("/login")
    public String login(User user, Model model){
        User u = userService.findOne(user.getUsername(), user.getPassword());
        if (u != null) {
            request.getSession().setAttribute("user", u);
            return "redirect:/cust/list.shtml";
        }
        model.addAttribute("message", "用户名或密码错误");
        return "login";
    }
}
