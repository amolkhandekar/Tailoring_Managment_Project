package com.rt.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.entity.Order;
import com.rt.repo.ReportRepository;
import com.rt.service.ReportService;

@Service
public class ReportServiceimpl implements ReportService {

	@Autowired
    private ReportRepository reportRepository;
	
	
	 @Override
	    public List<Order> getOrdersByDate(String date) {
	        return reportRepository.findByOrderDate(date);
	    }

	    @Override
	    public List<Order> getOrdersByMonth(String month) {
	        // month format "yyyy-MM"
	        return reportRepository.findByOrderDateStartingWith(month);
	    }

	    @Override
	    public List<Order> getOrdersByStatus(String status) {
	        return reportRepository.findByStatusIgnoreCase(status);
	    }

		

	    
	  
	    
	    
	  
	    
	    
	    
	    
	    
}
