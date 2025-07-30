package com.rt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UserReqDTO {
	
	 private String name;
	    private String mobile;
	    private String email;
	    private String address;
	    
	    private String password;
	    private String role;
    
}
