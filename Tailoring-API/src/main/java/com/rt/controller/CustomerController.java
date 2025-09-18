package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rt.dto.CustomerReqDTO;
import com.rt.entity.Customer;
import com.rt.repo.CustomerRepository;
import com.rt.service.CustomerService;

@RestController
@RequestMapping("/api")
@CrossOrigin("*")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @PostMapping("/saveCustomer")
    public String saveCustomer(@RequestBody CustomerReqDTO reqDto) {
        return customerService.saveCustomer(reqDto);
    }

    @GetMapping("/customers")
    public List<CustomerReqDTO> getAllCustomers() {
        return customerService.getAllCustomers();
    }

    @GetMapping("/customer/{id}")
    public CustomerReqDTO getCustomerById(@PathVariable Long id) {
        return customerService.getCustomerById(id);
    }
    @PostMapping("/update")
    public String updateCustomer(@RequestBody CustomerReqDTO dto) {
        return customerService.updateCustomer(dto);
    }
    @GetMapping("/names")
    public ResponseEntity<List<String>> getCustomerNames(@RequestParam String name) {
        List<String> names = customerService.getCustomerNamesByName(name);
        return new ResponseEntity<>(names, HttpStatus.OK);
    }
   
}
