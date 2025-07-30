package com.rt.service;

import java.util.List;

import com.rt.dto.MeasurementReqDTO;

public interface MeasurementService {

	String saveMeasurements(MeasurementReqDTO dto);
	    MeasurementReqDTO getMeasurementById(Long id);
		List<MeasurementReqDTO> getAllMeasurement();
		void updateMeasurement(MeasurementReqDTO measurementDto);


		   List<String> getCustomerNamesByQuery(String query);
		
	

	

}
