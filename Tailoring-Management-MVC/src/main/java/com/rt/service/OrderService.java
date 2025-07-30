package com.rt.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.rt.dto.OrderReqDTO;

@Service
public interface OrderService {

	void saveOrder(OrderReqDTO dto);

	List<OrderReqDTO> getAllOrders();

	OrderReqDTO getOrderById(Long id);

	 Map<String, Object> getOrders(String status, String customerName, int page, int size);

	String updateOrder(OrderReqDTO orderDTO);

	List<OrderReqDTO> searchOrders(String status, String customerName);
	 void updateOrderStatus(Long id, String status);


}
