// ReqUserDTO.java
package com.rt.dto;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqUserDTO {
    private String name;
    private String mobile;
    private String email;
    private String address;
    private String password;
    private String role;
}
