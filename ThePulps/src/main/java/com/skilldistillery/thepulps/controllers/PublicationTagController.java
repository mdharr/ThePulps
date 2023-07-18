package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.PublicationTag;
import com.skilldistillery.thepulps.services.PublicationTagService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class PublicationTagController {
	
	@Autowired
	private PublicationTagService publicationTagService;
	
	@GetMapping("publication-tags")
	public List<PublicationTag> getAllPublicationTags() {
		return publicationTagService.getAllPublicationTags();
	}

}
