package com.rt.controller;

import org.springframework.web.bind.annotation.*;
import com.rt.dto.LoginReqDTO;
import com.rt.dto.ReqUserDTO;
import com.rt.entity.User;
import com.rt.service.UserService;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@RestController
@RequestMapping("/api")
@CrossOrigin("*")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/saveUser")
    public ResponseEntity<String> registerUser(@RequestBody ReqUserDTO reqUserDTO) {
        // USER नको म्हणून direct ADMIN किंवा STAFF allow करा
        if(!reqUserDTO.getRole().equalsIgnoreCase("ADMIN") 
           && !reqUserDTO.getRole().equalsIgnoreCase("STAFF")) {
            return ResponseEntity.badRequest().body("Invalid role! Only ADMIN or STAFF allowed.");
        }

        userService.registerUser(reqUserDTO);
        return ResponseEntity.ok("User registered successfully with role: " + reqUserDTO.getRole());
    }

    
    
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody ReqUserDTO reqDto) {
        Optional<User> user = userService.validateUser(
                reqDto.getEmail(),
                reqDto.getPassword()
        );

        if (user.isPresent()) {
            User dbUser = user.get();

            ReqUserDTO response = new ReqUserDTO();
            response.setName(dbUser.getName());
            response.setMobile(dbUser.getMobile());
            response.setEmail(dbUser.getEmail());
            response.setAddress(dbUser.getAddress());
            response.setRole(dbUser.getRole());

            return ResponseEntity.ok(response); // JSON Response
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                 .body("Invalid credentials");
        }
    }





    
    }

    

