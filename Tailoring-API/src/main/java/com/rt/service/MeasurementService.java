package com.rt.service;

import java.util.List;

import com.rt.dto.CustomerReqDTO;
import com.rt.dto.MeasurementReqDTO;
import com.rt.entity.Measurement;



public interface MeasurementService {

	  List<MeasurementReqDTO> getAllMeasurements();
	    MeasurementReqDTO getMeasurementById(Long id);
		String updateMeasurement(MeasurementReqDTO dto);
		List<String> getCustomerNamesByQuery(String query);
		Measurement saveMeasurement(MeasurementReqDTO reqDto);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	


	


}
