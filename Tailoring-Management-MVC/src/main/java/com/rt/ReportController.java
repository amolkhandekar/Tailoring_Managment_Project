package com.rt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.rt.dto.OrderReqDTO;
import com.rt.service.ReportService;

@Controller
public class ReportController {
	
	 @Autowired
	    private ReportService reportService;

	 @GetMapping("/dailyreport")
	 public String getDailyReport(@RequestParam(required = false) String date, Model model) {
	     if (date == null || date.isEmpty()) {
	         date = java.time.LocalDate.now().toString();  // default today
	     }
	     List<OrderReqDTO> orders = reportService.getOrdersByDate(date);  // DTO वापर
	     model.addAttribute("orders", orders);
	     model.addAttribute("selectedDate", date);
	     return "report-daily";  // daily-report.jsp
	 }

	 // Monthly Report
	 @GetMapping("/monthlyreport")
	 public String getMonthlyReport(@RequestParam(required = false) String month, Model model) {
	     if (month == null || month.isEmpty()) {
	         month = java.time.LocalDate.now().toString().substring(0, 7);  // default current month yyyy-MM
	     }
	     List<OrderReqDTO> orders = reportService.getOrdersByMonth(month);  
	     model.addAttribute("orders", orders);
	     model.addAttribute("selectedMonth", month);
	     return "monthlyOrders";  // monthly-report.jsp
	 }
	 
	 @GetMapping("/OrderStatusReport/Pending")
	    public String getPendingOrders(Model model) {
	        List<OrderReqDTO> pendingOrders = reportService.getOrdersByStatus("pending");
	        model.addAttribute("orders", pendingOrders);
	        model.addAttribute("status", "Pending");
	        return "OrderStatusPending"; // JSP page name
	    }

	    // Show Delivered Orders
	    @GetMapping("/OrderStatusReport/Delivered")
	    public String getDeliveredOrders(Model model) {
	        List<OrderReqDTO> deliveredOrders = reportService.getOrdersByStatus("delivered");
	        model.addAttribute("orders", deliveredOrders);
	        model.addAttribute("status", "Delivered");
	        return "OrderStatusDelivered"; // JSP page name
	    }
}
