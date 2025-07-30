package com.rt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.rt.dto.CustomerReqDTO;
import com.rt.service.CustomerService;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/addUser")
    public String showAddCustomerForm() {
        return "addUser";  
    }

    @PostMapping("/addUser")
    public String saveUser(@ModelAttribute CustomerReqDTO reqDto, Model model) {
        String response = customerService.addCustomer(reqDto);
        model.addAttribute("message", response);
        return "redirect:/addUser"; 
    }

    @GetMapping("/viewAllCustomer")
    public String viewCustomers(Model model) {
        List<CustomerReqDTO> customers = customerService.getAllCustomers();
        model.addAttribute("customers", customers);
        return "viewAllCustomer"; 
    }

    @GetMapping("/updateCustomer")
    public String showUpdateForm(@RequestParam("id") Long id, Model model) {
        CustomerReqDTO customer = customerService.getCustomerById(id); 
        model.addAttribute("customer", customer); 
        return "updateCustomer";
    }
    
    @PostMapping("/updateCustomer")
    public String updateCustomer(@ModelAttribute CustomerReqDTO customerDto) {
        customerService.updateCustomer(customerDto); 
        return "redirect:/viewAllCustomer"; 
    }
    
    @GetMapping("/search-by-name")
    public String searchCustomerByName(@RequestParam String name, Model model) {
        List<CustomerReqDTO> customers = customerService.getCustomersByName(name);
        model.addAttribute("customers", customers);
        return "customer/customer-list"; 
    }
   
}
