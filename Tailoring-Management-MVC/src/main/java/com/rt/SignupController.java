
package com.rt;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rt.dto.UserReqDTO;
import com.rt.service.UserService;

@Controller
public class SignupController {

    @Autowired
    private UserService userService;

    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute UserReqDTO reqDto, Model model) {
        String response = userService.registerUser(reqDto);

        if ("Email already exists".equals(response)) {
            model.addAttribute("error", "Email already registered");
            return "signup"; 
        } else {
            model.addAttribute("success", "Signup successful!");
            return "login"; 
        }
    }


        
    }

