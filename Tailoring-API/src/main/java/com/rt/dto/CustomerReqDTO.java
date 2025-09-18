package com.rt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerReqDTO {
	 private Long id;
	 private String name;
	    private String mobile;
	    private String email;
	    private String address;
	    private String registrationDate;
}
