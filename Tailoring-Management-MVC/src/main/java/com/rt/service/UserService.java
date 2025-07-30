package com.rt.service;

import org.springframework.stereotype.Service;

import com.rt.dto.LoginReqDTO;
import com.rt.dto.UserReqDTO;

@Service
public interface UserService {
	
    String registerUser(UserReqDTO reqDto);


	UserReqDTO loginReqUser(LoginReqDTO dto);

	
   }

