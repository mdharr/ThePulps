package com.skilldistillery.thepulps.services;

import com.skilldistillery.thepulps.entities.User;

public interface AuthService {
	
	public User register(User user);
	public User getUserByUsername(String username);

}
