package com.rt.serviceimpl;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.dto.CustomerReqDTO;
import com.rt.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private RestTemplate restTemplate;

    private final String BASE_URL = "http://localhost:8181/api";

    @Override
    public String addCustomer(CustomerReqDTO reqDto) {
        String url = BASE_URL + "/saveCustomer";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<CustomerReqDTO> request = new HttpEntity<>(reqDto, headers);

        String response = restTemplate.postForObject(url, request, String.class);
        return response;
    }
    
    @Override
    public List<CustomerReqDTO> getAllCustomers() {
    	final String BASE_URL = "http://localhost:8181/api/customers";
        ResponseEntity<CustomerReqDTO[]> response =
            restTemplate.getForEntity(BASE_URL, CustomerReqDTO[].class);
        return Arrays.asList(response.getBody());
    }

    @Override
    public CustomerReqDTO getCustomerById(Long id) {
        String url = BASE_URL + "/customer/" + id;
        return restTemplate.getForObject(url, CustomerReqDTO.class);
    }
    
   
    
    
    @Override
    public String updateCustomer(CustomerReqDTO dto) {
        String url = BASE_URL + "/update";
        return restTemplate.postForObject(url, dto, String.class);
    }
    
    
    @Override
    public List<CustomerReqDTO> getCustomersByName(String name) {
        final String BASE_URL = "http://localhost:8181/api/names?name=" + name;

        ResponseEntity<CustomerReqDTO[]> response =
            restTemplate.getForEntity(BASE_URL, CustomerReqDTO[].class);

        return Arrays.asList(response.getBody());
    }



}