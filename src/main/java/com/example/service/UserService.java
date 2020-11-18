package com.example.service;

import com.example.model.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    Optional<User> getUser(String email);
    List<User> getUsers();
    boolean addUser(User user);

    boolean activeUser(String code);
}
