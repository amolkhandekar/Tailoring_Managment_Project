package com.rt;

import com.rt.dto.LoginReqDTO;

import com.rt.dto.UserReqDTO;
import com.rt.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/loginUser")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        @RequestParam String role,
                        HttpSession session) {

        LoginReqDTO dto = new LoginReqDTO(email, password, role);

        UserReqDTO user = userService.loginReqUser(dto);

        if (user != null) {
            session.setAttribute("loggedInUser", user);
            String userRole = user.getRole(); 

            System.out.println("ROLE FROM DB: " + userRole);

           
            if ("ADMIN".equalsIgnoreCase(userRole)) {
                return "redirect:/index";
            } else if ("STAFF".equalsIgnoreCase(userRole)) {
                return "redirect:/index";
            } else {
                return "redirect:/login"; 
            }

        } else {
            return "modules/login";
        }
    }

    @GetMapping("/index")
    public String index() {
        return "index"; 
    }
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; 
    }

}
