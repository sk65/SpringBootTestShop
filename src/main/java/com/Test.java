package com;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.*;

public class Test {
    private int v;

    public static void main(String[] args) {
        PasswordEncoder ps = new BCryptPasswordEncoder();
        System.out.println(ps.encode("admin"));
    }


}
