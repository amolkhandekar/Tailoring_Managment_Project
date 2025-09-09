package com.rt;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rt.dto.OrderReqDTO;
import com.rt.service.OrderService;

@Controller
public class OrderController {

	 @Autowired
	    private OrderService orderService;
	
	 @PostMapping("/saveOrder")
	    public String saveMeasurement(@ModelAttribute OrderReqDTO dto, Model model) {
		 orderService.saveOrder(dto); 
	        return "redirect:/add-order";
	    }
	 
	 
	 @GetMapping("/viewAllOrders")
	    public String viewAllOrders(
	            @RequestParam(required = false) String status,
	            @RequestParam(required = false) String customerName,
	            @RequestParam(defaultValue = "0") int page,
	            @RequestParam(defaultValue = "10") int size,
	            Model model) {

	        Map<String, Object> response = orderService.getOrders(status, customerName, page, size);

	        if (response != null) {
	            List<Map<String, Object>> content = (List<Map<String, Object>>) response.get("content");

	            model.addAttribute("orders", content);
	            model.addAttribute("totalPages", response.get("totalPages"));
	            model.addAttribute("currentPage", response.get("number"));
	        }

	        model.addAttribute("status", status);
	        model.addAttribute("customerName", customerName);

	        return "viewAllOrders";
	    }
	 
	 
	 @GetMapping("/editOrder")
	 public String showOrderForm(@RequestParam("id") Long id, Model model) {
	     OrderReqDTO order = orderService.getOrderById(id);
	     model.addAttribute("order", order);
	     return "updateOrder";   
	 }

	 @PostMapping("/update")
	 public String updateOrder(@ModelAttribute OrderReqDTO orderDTO) {
	     orderService.updateOrder(orderDTO);   
	     return "redirect:/viewAllOrders";  
	 }
	 
	 @GetMapping("/printOrder")
	 public String printOrder(@RequestParam("id") Long id, Model model) {
	     OrderReqDTO order = orderService.getOrderById(id);
	     model.addAttribute("order", order);
	     return "printOrderSlip";
	 }
	 


	 
}
