package com.rt.dto;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginReqDTO {
    private String email;
    private String password;
}
