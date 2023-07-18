package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Collection;
import com.skilldistillery.thepulps.repositories.CollectionRepository;

@Service
public class CollectionServiceImpl implements CollectionService {
	
	@Autowired
	private CollectionRepository collectionRepo;

	@Override
	public List<Collection> getAllCollections() {
		return collectionRepo.findAll();
	}

}
