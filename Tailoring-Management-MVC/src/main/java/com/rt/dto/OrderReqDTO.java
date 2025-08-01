package com.rt.dto;

import java.time.LocalDate;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderReqDTO {


    private Long Id;
    private String customerName;
   

    private Map<String, Integer> clothingQuantities;

    private String orderDate;
    private String dueDate;
    private String status;
    private String specialInstructions;
    private Double totalAmount;
    private LocalDate deliveryDate;
}
