package com.audiro.repository;

public interface UserDao {
    
    User selectById(String Id);
    int insert(User user);
    User selectByIdAndPassword(User user);

}
