// UserService.java
package com.rt.service;

import java.util.Optional;

import com.rt.dto.LoginReqDTO;
import com.rt.dto.ReqUserDTO;
import com.rt.entity.User;

public interface UserService {
	
    void registerUser(ReqUserDTO reqUserDTO);
    

	Optional<User> validateUser(String email, String password);
}
