package com.rt;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.rt.dto.OrderReqDTO;
import com.rt.dto.UserReqDTO;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String indexpage() {
        return "/login";
    }
    
   

    @GetMapping("/signup")
    public String signuppage(Model model) {
        model.addAttribute("customer", new UserReqDTO());
        return "modules/signup";
    }
    
    @GetMapping("/addorder")
    public String addorder() {
       
        return "/add-order";
    }

    @GetMapping("/showcustomer")
    public String showcustomer(Model model) {
        model.addAttribute("customer", new UserReqDTO());
        return "modules/showcustomer";
    }
   
    @GetMapping("/customerMeasurement")
    public String savemeasurement(Model model) {
        model.addAttribute("customer", new UserReqDTO());
        return "/customerMeasurement";
    }
    
    
    @GetMapping("/viewMeasurement")
    public String viewmeasurement(Model model) {
        model.addAttribute("customer", new UserReqDTO());
        return "/viewAllMeasurement";
    }
    
    
    @GetMapping("/updateMeasurement")
    public String updatemeasurement(Model model) {
        model.addAttribute("customer", new UserReqDTO());
        return "/updateMeasurement";
    }
    
    @GetMapping("/printOrder")
    public String printOrder(@RequestParam Long id, Model model) {
       
        return "printOrderSlip";  // JSP file path
    }
    }

