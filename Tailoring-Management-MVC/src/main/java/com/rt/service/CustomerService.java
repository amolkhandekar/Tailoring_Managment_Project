package com.rt.service;

import java.util.List;

import com.rt.dto.CustomerReqDTO;

public interface CustomerService {

    String addCustomer(CustomerReqDTO reqDto);

    List<CustomerReqDTO> getAllCustomers();
    
    CustomerReqDTO getCustomerById(Long id);
    
    String updateCustomer(CustomerReqDTO dto);

	List<CustomerReqDTO> getCustomersByName(String name);

	

   
   
}
