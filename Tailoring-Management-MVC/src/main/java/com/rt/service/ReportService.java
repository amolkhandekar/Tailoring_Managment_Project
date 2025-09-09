package com.rt.service;

import java.util.List;

import com.rt.dto.OrderReqDTO;

public interface ReportService {

	
	 List<OrderReqDTO> getOrdersByDate(String date);
	 List<OrderReqDTO> getOrdersByMonth(String month);
	List<OrderReqDTO> getOrdersByStatus(String status);
}
