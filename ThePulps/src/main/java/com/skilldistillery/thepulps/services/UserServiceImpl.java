package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.User;
import com.skilldistillery.thepulps.entities.UserProfile;
import com.skilldistillery.thepulps.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private UserProfileService userProfileService;

	@Override
	public List<User> getAllUsers() {
		return userRepo.findAll();
	}

	@Override
	public User getUserById(int userId) {
		User user = null;
		Optional<User> userOpt = userRepo.findById(userId);
		if(userOpt.isPresent()) {
			user = userOpt.get();
			UserProfile userProfile = userProfileService.getUserProfileByUserId(userId);
            user.setUserProfile(userProfile);
		}
		return user;
	}

}
