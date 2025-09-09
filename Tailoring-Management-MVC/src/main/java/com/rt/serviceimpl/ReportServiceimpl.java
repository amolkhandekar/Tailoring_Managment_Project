package com.rt.serviceimpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.dto.OrderReqDTO;
import com.rt.service.ReportService;


@Service
public class ReportServiceimpl implements ReportService{

	@Autowired
	private RestTemplate restTemplate;
	
	String BASE_URL = "http://localhost:8181/api/orders";
	
	 @Override
	    public List<OrderReqDTO> getOrdersByDate(String date) {
	        String url = BASE_URL + "/dailyreport?date=" + date;
	        OrderReqDTO[] response = restTemplate.getForObject(url, OrderReqDTO[].class);
	        return Arrays.asList(response);
	    }

	    @Override
	    public List<OrderReqDTO> getOrdersByMonth(String month) {
	        String url = BASE_URL + "/monthlyreport?month=" + month;
	        OrderReqDTO[] response = restTemplate.getForObject(url, OrderReqDTO[].class);
	        return Arrays.asList(response);
	    }

	    @Override
	    public List<OrderReqDTO> getOrdersByStatus(String status) {
	        String url = BASE_URL + "/report/" + status.toLowerCase();
	        ResponseEntity<OrderReqDTO[]> response = restTemplate.getForEntity(url, OrderReqDTO[].class);

	        return Arrays.asList(response.getBody());
	    }

}
