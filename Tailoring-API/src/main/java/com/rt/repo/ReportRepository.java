package com.rt.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.rt.entity.Order;

public interface ReportRepository extends JpaRepository<Order, Long>{

	List<Order> findByOrderDate(String date);

	List<Order> findByOrderDateStartingWith(String month);

	List<Order> findByStatusIgnoreCase(String status);
	
	

	


}
