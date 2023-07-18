package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Collection;
import com.skilldistillery.thepulps.services.CollectionService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class CollectionController {
	
	@Autowired
	private CollectionService collectionService;
	
	@GetMapping("collections")
	public List<Collection> getAllCollections() {
		return collectionService.getAllCollections();
	}

}
