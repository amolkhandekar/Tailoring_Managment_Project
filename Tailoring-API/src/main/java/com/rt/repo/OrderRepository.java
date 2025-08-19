package com.rt.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.rt.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{

	 Page<Order> findByStatus(String status, Pageable pageable);

	    Page<Order> findByCustomerNameContainingIgnoreCase(String customerName, Pageable pageable);

	    @Query("""
	    	    SELECT o FROM Order o
	    	    WHERE (:status IS NULL OR :status = '' OR o.status = :status)
	    	      AND (:name IS NULL OR :name = '' OR LOWER(o.customerName) LIKE LOWER(CONCAT('%', :name, '%')))
	    	    ORDER BY o.orderDate ASC
	    	""")

	    	Page<Order> filterOrders(@Param("status") String status,
	    	                         @Param("name") String name,
	    	                         Pageable pageable);


	   
	}