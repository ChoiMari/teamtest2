package com.audiro.dto;

import com.audiro.repository.User;

import lombok.Data;

@Data
public class UserSignInDto {
    private String id;
    private String passwordHash;
    
    public User toEntity() {
        return User.builder()
                .id(id)
                .passwordHash(passwordHash)
                .build();
    }
}
