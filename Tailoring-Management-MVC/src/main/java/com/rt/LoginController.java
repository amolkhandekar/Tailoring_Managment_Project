package com.rt;

import com.rt.dto.LoginReqDTO;

import com.rt.dto.UserReqDTO;
import com.rt.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/loginUser")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        // Create DTO for API call
        LoginReqDTO dto = new LoginReqDTO(email, password);

        try {
            // Call API using RestTemplate
            UserReqDTO user = userService.loginReqUser(dto);

            if (user != null) {
                // Set session attributes
                session.setAttribute("userName", user.getName());
                session.setAttribute("userRole", user.getRole());

                String userRole = user.getRole();
                System.out.println("ROLE FROM DB: " + userRole);

                // Redirect based on role
                if ("ADMIN".equalsIgnoreCase(userRole)) {
                    return "redirect:/index";  // Admin Dashboard
                } else if ("STAFF".equalsIgnoreCase(userRole)) {
                    return "staffDashboard"; // Staff Dashboard
                } else if ("USER".equalsIgnoreCase(userRole)) {
                    return "redirect:/customerDashboard"; // User Dashboard
                } else {
                    model.addAttribute("error", "Invalid role!");
                    return "modules/login";
                }

            } else {
                model.addAttribute("error", "Invalid username or password");
                return "modules/login";
            }

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Server error! Please try again later.");
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
