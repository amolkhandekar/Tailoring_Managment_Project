package com.rt.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.dto.LoginReqDTO;
import com.rt.dto.UserReqDTO;
import com.rt.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public String registerUser(UserReqDTO reqDto) {
        String url = "http://localhost:8181/api/saveUser";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<UserReqDTO> request = new HttpEntity<>(reqDto, headers);
        return restTemplate.postForObject(url, request, String.class);
    }

    

    @Override
    public UserReqDTO loginReqUser(LoginReqDTO reqDto) {
        String url = "http://localhost:8181/api/login";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<LoginReqDTO> request = new HttpEntity<>(reqDto, headers);
        return restTemplate.postForObject(url, request, UserReqDTO.class);
    }



	}
