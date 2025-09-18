package com.rt.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rt.dto.CustomerReqDTO;
import com.rt.entity.Customer;

@Service
public interface CustomerService {
	
    String saveCustomer(CustomerReqDTO reqDto);
    
    List<CustomerReqDTO> getAllCustomers();
    
    CustomerReqDTO getCustomerById(Long id);

	String updateCustomer(CustomerReqDTO dto);


	List<String> getCustomerNamesByName(String name);

	
	   
	  
}
