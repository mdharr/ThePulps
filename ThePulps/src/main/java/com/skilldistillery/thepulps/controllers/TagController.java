package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Tag;
import com.skilldistillery.thepulps.services.TagService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class TagController {
	
	@Autowired
	private TagService tagService;
	
	@GetMapping("tags")
	public List<Tag> getAllTags() {
		return tagService.getAllTags();
	}

}
