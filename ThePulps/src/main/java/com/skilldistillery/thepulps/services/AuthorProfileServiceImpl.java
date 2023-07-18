package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.AuthorProfile;
import com.skilldistillery.thepulps.repositories.AuthorProfileRepository;

@Service
public class AuthorProfileServiceImpl implements AuthorProfileService {
	
	@Autowired
	private AuthorProfileRepository authorProfileRepo;

	@Override
	public List<AuthorProfile> getAllAuthorProfiles() {
		return authorProfileRepo.findAll();
	}

}
