package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.UserProfile;
import com.skilldistillery.thepulps.repositories.UserProfileRepository;

@Service
public class UserProfileServiceImpl implements UserProfileService {
	
	@Autowired
	private UserProfileRepository userProfileRepo;

	@Override
	public List<UserProfile> getAllUserProfiles() {
		return userProfileRepo.findAll();
	}

}
