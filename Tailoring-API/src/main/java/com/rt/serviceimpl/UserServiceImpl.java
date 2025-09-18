// UserServiceImpl.java
package com.rt.serviceimpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rt.dto.ReqUserDTO;
import com.rt.entity.User;
import com.rt.mapper.UserMapper;
import com.rt.repo.UserRepository;
import com.rt.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void registerUser(ReqUserDTO reqUserDTO) {
        User user = UserMapper.toEntity(reqUserDTO);
        userRepository.save(user);
    }

   
   

    @Override
    public Optional<User> validateUser(String email, String password) {
        User user = userRepository.findByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            return Optional.of(user);  // valid login
        }
        return Optional.empty();  // invalid login
    }


	    


}
