package com.audiro.dto;



import com.audiro.repository.User;

import lombok.Data;

// 회원 가입 요청에서 요청 파라미터들을 저장하기 위한 DTO
@Data
public class UserCreateDto {
    private String id;
    private String passwordHash;
	private String userName;
	private String nickname;
	private String phone;
	private String email;
    public User toEntity() {
        return User.builder()
                .id(id)
                .passwordHash(passwordHash)
                .userName(userName)
                .nickname(nickname)
                .phone(phone)
                .email(email)
                .build();
    }
}
