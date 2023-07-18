package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.MagazineHtml;
import com.skilldistillery.thepulps.services.MagazineHtmlService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MagazineHtmlController {
	
	@Autowired
	private MagazineHtmlService magazineHtmlService;
	
	@GetMapping("magazine-htmls")
	public List<MagazineHtml> getAllMagazineHtmls() {
		return magazineHtmlService.getAllMagazineHtmls();
	}

}
