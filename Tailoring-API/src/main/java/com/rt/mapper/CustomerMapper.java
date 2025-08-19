package com.rt.mapper;

import com.rt.dto.CustomerReqDTO;
import com.rt.entity.Customer;

public class CustomerMapper {

	  // Convert DTO to Entity
    public static Customer toEntity(CustomerReqDTO dto) {
        Customer customer = new Customer();
        customer.setName(dto.getName());
        customer.setMobile(dto.getMobile());
        customer.setEmail(dto.getEmail());
        customer.setAddress(dto.getAddress());
        customer.setRegistrationDate(dto.getRegistrationDate());
        return customer;
    }

    // Convert Entity to DTO (optional)
    public static CustomerReqDTO toDTO(Customer entity) {
        CustomerReqDTO dto = new CustomerReqDTO();
        dto.setName(entity.getName());
        dto.setMobile(entity.getMobile());
        dto.setEmail(entity.getEmail());
        dto.setAddress(entity.getAddress());
        dto.setRegistrationDate(entity.getRegistrationDate());
        return dto;
    }

	

}
