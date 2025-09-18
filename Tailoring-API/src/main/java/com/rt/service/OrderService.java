package com.rt.service;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.rt.dto.OrderReqDTO;
import com.rt.entity.Order;

public interface OrderService {
	
	String saveOrder(OrderReqDTO reqDto);

	Page<Order> getAllOrders(String status, String customerName, Pageable pageable);


    OrderReqDTO getOrderById(Long id);

    String updateOrder(OrderReqDTO dto);

    void updateOrderStatus(Long id, String status);


//	OrderSlipDTO getOrderSlip(Long orderId);

	
}