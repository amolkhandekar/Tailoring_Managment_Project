package com.rt.serviceimpl;

import java.util.Arrays;



import java.util.List;
import java.util.Map;
import com.rt.dto.OrderReqDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.service.OrderService;

@Service
public class OrderServiceimpl implements OrderService{

	@Autowired
	private RestTemplate restTemplate;
	
	String BASE_URL = "http://localhost:8181/api/orders";
	
	
	
	@Override
	public void saveOrder(OrderReqDTO dto) {
		
		 System.out.println("🔍 Order Data Sending: " + dto); 
	    String url = BASE_URL + "/saveOrder";
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);

	    HttpEntity<OrderReqDTO> request = new HttpEntity<>(dto, headers);

	    String response = restTemplate.postForObject(url, request, String.class);
	    System.out.println("Order Save Response: " + response); 
	}



	 @Override
	    public List<OrderReqDTO> getAllOrders() {
	        OrderReqDTO[] orders = restTemplate.getForObject(BASE_URL + "/getallorders", OrderReqDTO[].class);
	        return Arrays.asList(orders);
	    }

	 @Override
	 public OrderReqDTO getOrderById(Long id) {
	     String url = BASE_URL + "/order/" + id;
	     OrderReqDTO dto = restTemplate.getForObject(url, OrderReqDTO.class);
	     System.out.println("Fetched Order: " + dto);
	     return dto;
	 }
	 
	    @Override
	    public String updateOrder(OrderReqDTO dto) {
	        return restTemplate.postForObject(BASE_URL + "/update", dto, String.class);
	    }

	    @Override
	    public void updateOrderStatus(Long id, String status) {
	        restTemplate.put(BASE_URL + "/status/" + id + "?status=" + status, null);
	    }

	    @Override
	    public List<OrderReqDTO> searchOrders(String status, String customerName) {
	        String url = BASE_URL + "/search?status=" + (status != null ? status : "") +
	                     "&customerName=" + (customerName != null ? customerName : "");
	        OrderReqDTO[] response = restTemplate.getForObject(url, OrderReqDTO[].class);
	        return Arrays.asList(response);
	    }



	    @Override
	    public Map<String, Object> getOrders(String status, String customerName, int page, int size) {
	        String url = BASE_URL + "/search?page=" + page + "&size=" + size;

	        if (status != null && !status.isEmpty()) url += "&status=" + status;
	        if (customerName != null && !customerName.isEmpty()) url += "&customerName=" + customerName;

	        ResponseEntity<Map<String, Object>> response = restTemplate.exchange(
	                url,
	                HttpMethod.GET,
	                null,
	                new ParameterizedTypeReference<Map<String, Object>>() {}
	        );

	        return response.getBody();
	    }





	   




}
