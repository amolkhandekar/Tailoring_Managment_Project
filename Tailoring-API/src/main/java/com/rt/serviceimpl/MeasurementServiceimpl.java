 package com.rt.serviceimpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.dto.MeasurementReqDTO;
import com.rt.entity.Measurement;
import com.rt.entity.Order;
import com.rt.mapper.MeasurementMapper;
import com.rt.repo.MeasurementRepository;
import com.rt.repo.OrderRepository;
import com.rt.service.MeasurementService;

@Service
public class MeasurementServiceimpl implements MeasurementService {

    @Autowired
    private MeasurementRepository measurementRepository;



    @Override
    public Measurement saveMeasurement(MeasurementReqDTO reqDto) {
        Measurement measurement = MeasurementMapper.toEntity(reqDto);
        return measurementRepository.save(measurement);
    }

        


    @Override
    public List<MeasurementReqDTO> getAllMeasurements() {
        return measurementRepository.findAll().stream()
                .map(MeasurementMapper::toDTO) 
                .collect(Collectors.toList());
    }


    @Override
    public MeasurementReqDTO getMeasurementById(Long id) {
        return measurementRepository.findById(id)
        		.map(MeasurementMapper::toDTO)

                .orElse(null);
    }

    @Override
    public String updateMeasurement(MeasurementReqDTO dto) {
        Optional<Measurement> optional = measurementRepository.findById(dto.getId());
        if (optional.isPresent()) {
            Measurement existing = optional.get();

            Measurement updated = MeasurementMapper.toEntity(dto);

            
            updated.setId(existing.getId()); // ID is same
            if (updated.getRegistrationDate() == null) {
                updated.setRegistrationDate(existing.getRegistrationDate());
            }

            measurementRepository.save(updated);
            return "Measurement updated successfully";
        }
        return "Measurement not found";
    }



    @Override
    public List<String> getCustomerNamesByQuery(String query) {
        String lowercaseQuery = query.toLowerCase();
        return measurementRepository.findDistinctCustomerNamesByQuery(lowercaseQuery);
    }





    

    
}
	    