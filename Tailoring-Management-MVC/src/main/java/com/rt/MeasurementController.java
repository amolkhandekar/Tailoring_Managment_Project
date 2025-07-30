package com.rt;

import com.rt.dto.MeasurementReqDTO;

import com.rt.service.MeasurementService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MeasurementController {

    @Autowired
    private MeasurementService measurementService;

    @PostMapping("/saveMeasurement")
    public String saveMeasurement(@ModelAttribute MeasurementReqDTO dto) {
        measurementService.saveMeasurements(dto);
        return "redirect:/customerMeasurement";
    }

    
    @GetMapping("/viewAllMeasurement")
    public String viewMeasurement(Model model) {
        List<MeasurementReqDTO> measurements = measurementService.getAllMeasurement();
        
        model.addAttribute("measurements", measurements);
        return "viewAllMeasurement"; 
    }

    @GetMapping("/measurement/{id}")
    @ResponseBody
    public MeasurementReqDTO getMeasurementById(@PathVariable Long id) {
       return measurementService.getMeasurementById(id);
  }
    
    @GetMapping("/updateMeasurementForm")
    public String showUpdateForm(@RequestParam("id") Long id, Model model) {
        MeasurementReqDTO dto = measurementService.getMeasurementById(id);
        model.addAttribute("measurement", dto); 
        return "updateMeasurement"; 
    }

    @PostMapping("/updateMeasurement")
    public String updateMeasurement(@ModelAttribute MeasurementReqDTO dto) {
        measurementService.updateMeasurement(dto);
        return "redirect:/viewAllMeasurement";
    }

    @GetMapping("/customer-names")
    @ResponseBody 
    public List<String> getCustomerNames(@RequestParam String query) {
        return measurementService.getCustomerNamesByQuery(query);
    }

}
    

