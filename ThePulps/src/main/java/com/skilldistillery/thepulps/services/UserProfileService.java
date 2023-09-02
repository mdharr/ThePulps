package com.skilldistillery.thepulps.services;

import java.util.List;

import com.skilldistillery.thepulps.entities.UserProfile;

public interface UserProfileService {
	
	public List<UserProfile> getAllUserProfiles();
	
	public UserProfile getUserProfileByUserId(int userId);

}
