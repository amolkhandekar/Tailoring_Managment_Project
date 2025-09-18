package com.rt.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.rt.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	

	

	User findByEmail(String email);

}
