package com.itcast.controller;

import com.itcast.dao.UserDao;
import com.itcast.model.Cust;
import com.itcast.model.User;
import com.itcast.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    private CustService custService;

    @Autowired
    private UserDao userDao;


    @RequestMapping("/list")
    public String list(Model model){
        List<Cust> custs = custService.findAll();
        model.addAttribute("custs", custs);
        return "index";
    }

    @RequestMapping("/delete")
    public String delete(Long cid){
        int count = custService.delete(cid);
        return "redirect:/cust/list.shtml";
    }

    @RequestMapping("/add")
    public String add(Cust cust){
        int count = custService.add(cust);
        return "redirect:/cust/list.shtml";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model){
        List<User> users = userDao.findAll();
        model.addAttribute("users", users);
        return "index";
    }

    @RequestMapping("/find")
    public String find(String cust_name, String cust_type, Model model){
        List<Cust> custs = custService.find(cust_name, cust_type);
        model.addAttribute("custs", custs);
        return "index";
    }

}
