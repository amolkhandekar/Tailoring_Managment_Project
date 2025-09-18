package com.rt.mapper;

import java.util.HashMap;

import com.rt.dto.OrderReqDTO;
import com.rt.entity.Order;

public class OrderMapper {


	  // Convert Entity → DTO
    public static OrderReqDTO toDTO(Order entity) {
        if (entity == null) return null;

        OrderReqDTO dto = new OrderReqDTO();
        dto.setId(entity.getId());
        dto.setCustomerName(entity.getCustomerName());
        dto.setClothingQuantities(
            entity.getClothingQuantities() != null
                ? new HashMap<>(entity.getClothingQuantities())
                : null
        );
        dto.setOrderDate(entity.getOrderDate());
        dto.setDueDate(entity.getDueDate());
        dto.setStatus(entity.getStatus());
        dto.setSpecialInstructions(entity.getSpecialInstructions());
        dto.setTotalAmount(entity.getTotalAmount());
        return dto;
    }

    // Convert DTO → Entity
    public static Order toEntity(OrderReqDTO dto) {
        if (dto == null) return null;

        Order entity = new Order();
        entity.setId(dto.getId());
        entity.setCustomerName(dto.getCustomerName());
        entity.setClothingQuantities(
            dto.getClothingQuantities() != null
                ? new HashMap<>(dto.getClothingQuantities())
                : null
        );
        entity.setOrderDate(dto.getOrderDate());
        entity.setDueDate(dto.getDueDate());
        entity.setStatus(dto.getStatus());
        entity.setSpecialInstructions(dto.getSpecialInstructions());
        entity.setTotalAmount(dto.getTotalAmount());
        return entity;
    }
}
