package com.rt.service;

import java.util.List;

import com.rt.entity.Order;

public interface ReportService {

	
	  List<Order> getOrdersByDate(String date);
	    List<Order> getOrdersByMonth(String month);
	    
	    List<Order> getOrdersByStatus(String status);
	    
	    
		
	    
}
