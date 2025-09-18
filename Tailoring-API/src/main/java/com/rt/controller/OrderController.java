package com.rt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rt.dto.OrderReqDTO;
import com.rt.entity.Order;
import com.rt.mapper.OrderMapper;
import com.rt.service.OrderService;

@RestController
@RequestMapping("/api/orders")
@CrossOrigin("*")
public class OrderController {

	
	@Autowired
    private OrderService orderService;
	
	

    @PostMapping("/saveOrder")
    public String saveOrder(@RequestBody OrderReqDTO reqDto) {
        return orderService.saveOrder(reqDto);
    }
    
    @GetMapping("/search")
    public Page<OrderReqDTO> searchOrders(
    		 @RequestParam(required = false) String status,
    	        @RequestParam(required = false) String customerName,
    	        @RequestParam(defaultValue = "0") int page,
    	        @RequestParam(defaultValue = "10") int size) {

    	Pageable pageable = PageRequest.of(page, size, Sort.by("orderDate").ascending());


    	    Page<Order> ordersPage = orderService.getAllOrders(status, customerName, pageable);

    	   
    	    return ordersPage.map(OrderMapper::toDTO);
    	}

    

    // ✅ Get order by ID (for update or print slip)
    @GetMapping("/order/{id}")
    public OrderReqDTO getOrderById(@PathVariable Long id) {
        return orderService.getOrderById(id);
    }

    // ✅ Update full order details
    @PostMapping("/update")
    public String updateOrder(@RequestBody OrderReqDTO dto) {
        return orderService.updateOrder(dto);
    }

    // ✅ Update only status (Pending → Ready → Delivered)
    @PostMapping("/updateStatus")
    public String updateStatus(@RequestParam Long id, @RequestParam String status) {
        orderService.updateOrderStatus(id, status);
        return "Order status updated successfully";
    }



    
    
}
