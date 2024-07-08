package com.audiro.service;

import org.springframework.stereotype.Service;

import com.audiro.dto.UserCreateDto;
import com.audiro.dto.UserSignInDto;
import com.audiro.repository.User;
import com.audiro.repository.UserDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {
    
    private final UserDao userDao;
    
    // 아이디 중복 체크: true - 중복되지 않은 아이디(사용 가능한 아이디), false - 중복된 아이디.
    public boolean checkId(String id) {
        log.debug("checkId(id={})", id);
        
        User user = userDao.selectById(id);
        if (user == null) { // id가 일치하는 레코드가 없을 때(중복된 아이디가 없는 경우)
            return true;
        } else { // id가 일치하는 레코드가 있을 때(아이디가 중복된 경우)
            return false;
        }
    }
    
    // 회원 가입 서비스
    public int create(UserCreateDto dto) {
        log.debug("create({})", dto);
        
        int result = userDao.insert(dto.toEntity());
        
        return result;
    }
    
    // 로그인 서비스
    public User read(UserSignInDto dto) {
        log.debug("read({})", dto);
        
        User user = userDao.selectByIdAndPassword(dto.toEntity());
        
        return user;
    }
}
