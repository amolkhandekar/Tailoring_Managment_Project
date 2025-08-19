package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.rt.entity.Order;
import com.rt.service.ReportService;

@RestController
@RequestMapping("/api/orders")
@CrossOrigin("*")
public class ReportController {

	@Autowired
    private ReportService reportService;
	
	 @GetMapping("/dailyreport")
	    @ResponseBody
	    public List<Order> getDailyReport(@RequestParam String date) {
	        return reportService.getOrdersByDate(date);
	        
	    }

	    @GetMapping("/monthlyreport")
	    public List<Order> getMonthlyOrders(@RequestParam String month) {
	        return reportService.getOrdersByMonth(month);
	    }
	
	    @GetMapping("/report/pending")
	    public List<Order> getPendingOrders() {
	        return reportService.getOrdersByStatus("Pending");
	    }

	    // ✅ Delivered orders list
	    @GetMapping("/report/delivered")
	    public List<Order> getDeliveredOrders() {
	        return reportService.getOrdersByStatus("Delivered");
	    }
}
