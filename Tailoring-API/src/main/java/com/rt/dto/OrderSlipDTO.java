package com.rt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderSlipDTO {
    private Long orderId;
    private String customerName;
    private String customerEmail;
    private String customerAddress;
    private String customerMobile;
    private String clothingQuantities;  // Map instead of directly using Map in DTO
    private LocalDate orderDate;
    private LocalDate dueDate;
    private String status;
    private String specialInstructions;
    private Double totalAmount;
    private LocalDate deliveryDate;
}
