package com.rt.repo;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rt.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

	 List<Customer> findByNameContainingIgnoreCase(String name);

	

	
	

}
