package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.AuthorTag;
import com.skilldistillery.thepulps.repositories.AuthorTagRepository;

@Service
public class AuthorTagServiceImpl implements AuthorTagService {
	
	@Autowired
	private AuthorTagRepository authorTagRepo;

	@Override
	public List<AuthorTag> getAllAuthorTags() {
		return authorTagRepo.findAll();
	}

}
