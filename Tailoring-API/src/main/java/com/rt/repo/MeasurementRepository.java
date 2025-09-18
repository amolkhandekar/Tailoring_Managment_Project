package com.rt.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.rt.entity.Customer;
import com.rt.entity.Measurement;


public interface MeasurementRepository extends JpaRepository<Measurement, Long> {
	

	@Query("SELECT DISTINCT LOWER(m.customerName) FROM Measurement m WHERE LOWER(m.customerName) LIKE CONCAT(:query, '%')")
	List<String> findDistinctCustomerNamesByQuery(@Param("query") String query);



}

