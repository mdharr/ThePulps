package com.skilldistillery.thepulps.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("magazines/{mid}/magazine-html")
	public MagazineHtml getMagazineHtmlByMagazineId(@PathVariable("mid") int magazineId, HttpServletRequest req, HttpServletResponse res) {
		return magazineHtmlService.getMagazineHtmlByMagazineId(magazineId);
	}
	
	@GetMapping("magazine-htmls/{mhid}")
	public MagazineHtml getMagazineHtmlById(@PathVariable("mhid") int magazineHtmlId, HttpServletRequest req, HttpServletResponse res) {
		return magazineHtmlService.getMagazineHtmlById(magazineHtmlId);
	}

}
