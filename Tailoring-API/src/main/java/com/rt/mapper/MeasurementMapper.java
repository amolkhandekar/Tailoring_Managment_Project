package com.rt.mapper;

import com.rt.dto.MeasurementReqDTO;
import com.rt.entity.Measurement;

public class MeasurementMapper {


    public static Measurement toEntity(MeasurementReqDTO dto) {
        Measurement measurement = new Measurement();
        // ❌ Id सेट करू नका → Hibernate स्वतः सेट करेल
        measurement.setRegistrationDate(dto.getRegistrationDate()); 
        measurement.setCustomerName(dto.getCustomerName());
        measurement.setType(dto.getType());

        measurement.setChest(dto.getChest());
        measurement.setWaist(dto.getWaist());
        measurement.setShoulder(dto.getShoulder());
        measurement.setSleeve(dto.getSleeve());
        measurement.setLength(dto.getLength());

        measurement.setWaistPant(dto.getWaistPant());
        measurement.setInseam(dto.getInseam());
        measurement.setLengthPant(dto.getLengthPant());
        measurement.setHip(dto.getHip());

        measurement.setChestKurta(dto.getChestKurta());
        measurement.setWaistKurta(dto.getWaistKurta());
        measurement.setLengthKurta(dto.getLengthKurta());
        measurement.setShoulderKurta(dto.getShoulderKurta());

        return measurement;
    }

    public static MeasurementReqDTO toDTO(Measurement measurement) {
        MeasurementReqDTO dto = new MeasurementReqDTO();
        dto.setId(measurement.getId());
        dto.setRegistrationDate(measurement.getRegistrationDate());
        dto.setCustomerName(measurement.getCustomerName());
        dto.setType(measurement.getType());

        dto.setChest(measurement.getChest());
        dto.setWaist(measurement.getWaist());
        dto.setShoulder(measurement.getShoulder());
        dto.setSleeve(measurement.getSleeve());
        dto.setLength(measurement.getLength());

        dto.setWaistPant(measurement.getWaistPant());
        dto.setInseam(measurement.getInseam());
        dto.setLengthPant(measurement.getLengthPant());
        dto.setHip(measurement.getHip());

        dto.setChestKurta(measurement.getChestKurta());
        dto.setWaistKurta(measurement.getWaistKurta());
        dto.setLengthKurta(measurement.getLengthKurta());
        dto.setShoulderKurta(measurement.getShoulderKurta());

        return dto;
    }
}