package com.rt.entity;

import java.util.Date;

import jakarta.persistence.*; 
import lombok.*;

@Entity
@Table(name = "measurement")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Measurement {

	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @Temporal(TemporalType.DATE)
	    @Column(name = "registration_date")
	    private Date registrationDate;

	    private String customerName;
	    private String type;

	    private Double chest;
	    private Double waist;
	    private Double shoulder;
	    private Double sleeve;
	    private Double length;

	    private Double waistPant;
	    private Double inseam;
	    private Double lengthPant;
	    private Double hip;

	    private Double chestKurta;
	    private Double waistKurta;
	    private Double lengthKurta;
	    private Double shoulderKurta;
}
