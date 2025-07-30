package com.rt.serviceimpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.rt.dto.MeasurementReqDTO;
import com.rt.service.MeasurementService;

@Service
public class MeasurementServiceImpl implements MeasurementService{

	@Autowired
	private RestTemplate restTemplate;

	private static final String BASE_URL = "http://localhost:8181/api/measurements";

	@Override
	public String saveMeasurements(MeasurementReqDTO dto) {
	    try {
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);

	        HttpEntity<MeasurementReqDTO> request = new HttpEntity<>(dto, headers);

	  
	        String response = restTemplate.postForObject(BASE_URL + "/saveMeasurement", request, String.class);

	        return response;  
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Error: " + e.getMessage();
	    }
	}



	@Override
	public List<MeasurementReqDTO> getAllMeasurement() {
		final String BASE_URL = "http://localhost:8181/api/measurements/all";
        ResponseEntity<MeasurementReqDTO[]> response =
            restTemplate.getForEntity(BASE_URL, MeasurementReqDTO[].class);
        return Arrays.asList(response.getBody());
    }



        @Override
        public MeasurementReqDTO getMeasurementById(Long id) {
        return restTemplate.getForObject(BASE_URL + "/" + id, MeasurementReqDTO.class);
   }

       @Override
     public void updateMeasurement(MeasurementReqDTO dto) {
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_JSON);
    HttpEntity<MeasurementReqDTO> request = new HttpEntity<>(dto, headers);

    restTemplate.exchange(BASE_URL + "/update", HttpMethod.POST, request, String.class);
}
       
       
       @Override
       public List<String> getCustomerNamesByQuery(String query) {
           final String BASE_URL = "http://localhost:8181/api/measurements/customer-names?query=" + query;

           ResponseEntity<String[]> response = restTemplate.getForEntity(BASE_URL, String[].class);

           return Arrays.asList(response.getBody());
       }



       
       
		    }
		



		

	
	
	
	

	

