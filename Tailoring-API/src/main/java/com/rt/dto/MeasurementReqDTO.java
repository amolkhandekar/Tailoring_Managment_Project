package com.rt.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MeasurementReqDTO {


	private long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")  
    private Date registrationDate;

    private String customerName;
    private String type;

    // Shirt
    private Double chest;
    private Double waist;
    private Double shoulder;
    private Double sleeve;
    private Double length;

    // Pant
    private Double waistPant;
    private Double inseam;
    private Double lengthPant;
    private Double hip;

    // Kurta
    private Double chestKurta;
    private Double waistKurta;
    private Double lengthKurta;
    private Double shoulderKurta;
}
