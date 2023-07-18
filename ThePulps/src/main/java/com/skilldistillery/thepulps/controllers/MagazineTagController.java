package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.MagazineTag;
import com.skilldistillery.thepulps.services.MagazineTagService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MagazineTagController {
	
	@Autowired
	private MagazineTagService magazineTagService;
	
	@GetMapping("magazine-tags")
	public List<MagazineTag> getAllMagazineTags() {
		return magazineTagService.getAllMagazineTags();
	}

}
