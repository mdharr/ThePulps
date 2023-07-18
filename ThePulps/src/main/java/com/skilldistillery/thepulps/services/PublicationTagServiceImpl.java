package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.PublicationTag;
import com.skilldistillery.thepulps.repositories.PublicationTagRepository;

@Service
public class PublicationTagServiceImpl implements PublicationTagService {
	
	@Autowired
	private PublicationTagRepository publicationTagRepo;

	@Override
	public List<PublicationTag> getAllPublicationTags() {
		return publicationTagRepo.findAll();
	}

}
