package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.User;
import com.skilldistillery.thepulps.services.UserService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class UserController {
	
	@Autowired
	private UserService userService;
	
    @GetMapping("users")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

}
