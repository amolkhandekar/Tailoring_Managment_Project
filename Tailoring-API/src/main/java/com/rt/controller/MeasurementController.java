package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rt.dto.CustomerReqDTO;
import com.rt.dto.MeasurementReqDTO;
import com.rt.entity.Measurement;
import com.rt.service.MeasurementService;
@RestController
@RequestMapping("/api/measurements")
@CrossOrigin("*")
public class MeasurementController {

    @Autowired
    private MeasurementService measurementService;


    @PostMapping("/saveMeasurement")
    public Measurement saveMeasurement(@RequestBody MeasurementReqDTO reqDto) {
        return measurementService.saveMeasurement(reqDto);
    }

    @GetMapping("/all")
    public List<MeasurementReqDTO> getAllMeasurements() {
        return measurementService.getAllMeasurements();
    }

    

    @GetMapping("/{id}")
    public ResponseEntity<MeasurementReqDTO> getMeasurementById(@PathVariable Long id) {
        MeasurementReqDTO dto = measurementService.getMeasurementById(id);
        return ResponseEntity.ok(dto);
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateMeasurement(@RequestBody MeasurementReqDTO dto) {
        measurementService.updateMeasurement(dto);
        return ResponseEntity.ok("Updated");
    }


    @GetMapping("/customer-names")
    public List<String> getCustomerNames(@RequestParam(defaultValue = "") String query) {
        return measurementService.getCustomerNamesByQuery(query);
    }




    
}
