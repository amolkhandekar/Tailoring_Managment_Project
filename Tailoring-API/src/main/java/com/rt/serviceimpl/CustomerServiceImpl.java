package com.rt.serviceimpl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.dto.CustomerReqDTO;
import com.rt.entity.Customer;
import com.rt.mapper.CustomerMapper;
import com.rt.repo.CustomerRepository;
import com.rt.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public String saveCustomer(CustomerReqDTO reqDto) {
        Customer customer = new Customer();
        customer.setName(reqDto.getName());
        customer.setMobile(reqDto.getMobile());
        customer.setEmail(reqDto.getEmail());
        customer.setAddress(reqDto.getAddress());
        customer.setRegistrationDate(reqDto.getRegistrationDate());

        customerRepository.save(customer);

        return "Customer saved successfully!";
    }

    @Override
    public List<CustomerReqDTO> getAllCustomers() {
        List<Customer> customerList = customerRepository.findAll();

        // Map Entity → DTO
        return customerList.stream()
                .map(customer -> {
                    CustomerReqDTO dto = new CustomerReqDTO();
                    dto.setId(customer.getId());
                    dto.setName(customer.getName());
                    dto.setMobile(customer.getMobile());
                    dto.setEmail(customer.getEmail());
                    dto.setAddress(customer.getAddress());
                    dto.setRegistrationDate(customer.getRegistrationDate());
                    return dto;
                })
                .collect(Collectors.toList());
    }

    @Override
    public CustomerReqDTO getCustomerById(Long id) {
        Customer customer = customerRepository.findById(id).orElse(null);
        if (customer == null) {
            return null;
        }
        CustomerReqDTO dto = new CustomerReqDTO();
        dto.setId(customer.getId());
        dto.setName(customer.getName());
        dto.setMobile(customer.getMobile());
        dto.setEmail(customer.getEmail());
        dto.setAddress(customer.getAddress());
        dto.setRegistrationDate(customer.getRegistrationDate());
        return dto;
    }

	@Override
	public String updateCustomer(CustomerReqDTO dto) {
		  Customer customer = customerRepository.findById(dto.getId()).orElseThrow();
	        BeanUtils.copyProperties(dto, customer);
	        customerRepository.save(customer);
	        return "Customer updated successfully";
	}

	 @Override
	    public List<String> getCustomerNamesByName(String name) {
	        return customerRepository.findByNameContainingIgnoreCase(name)
	                .stream()
	                .map(Customer::getName)
	                .collect(Collectors.toList());
	    }

	
	
	}
