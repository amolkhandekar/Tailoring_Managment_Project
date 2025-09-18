package com.rt.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor


@Table(name = "user", uniqueConstraints = {
        @UniqueConstraint(columnNames = "email")
})
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String mobile;
    private String email;
    private String address;
    private String password;
    private String role;
	public User orElse(Object object) {
		// TODO Auto-generated method stub
		return null;
	}
}
