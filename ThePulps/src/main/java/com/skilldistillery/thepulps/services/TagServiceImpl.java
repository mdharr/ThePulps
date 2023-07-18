package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Tag;
import com.skilldistillery.thepulps.repositories.TagRepository;

@Service
public class TagServiceImpl implements TagService {
	
	@Autowired
	private TagRepository tagRepo;

	@Override
	public List<Tag> getAllTags() {
		return tagRepo.findAll();
	}

}
