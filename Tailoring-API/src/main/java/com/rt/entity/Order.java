package com.rt.entity;

import java.util.Map;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "orders")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String customerName;

    @ElementCollection
    @CollectionTable(
        name = "order_clothing_quantities",
        joinColumns = @JoinColumn(name = "order_id")
    )
    @MapKeyColumn(name = "clothing_type")
    @Column(name = "quantity")
    private Map<String, Integer> clothingQuantities;

    private String orderDate;
    private String dueDate;
    private String status;
    private String specialInstructions;
    private Double totalAmount;
    

   

}