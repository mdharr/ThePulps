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

import com.skilldistillery.thepulps.entities.Advertisement;
import com.skilldistillery.thepulps.services.AdvertisementService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class AdvertisementController {
	
	@Autowired
	private AdvertisementService advertisementService;
	
	@GetMapping("advertisements")
	public List<Advertisement> getAllAdvertisements() {
		return advertisementService.getAllAdvertisements();
	}
	
	@GetMapping("magazines/{mid}/advertisements")
	public List<Advertisement> getAllAdvertisementsByMagazineId(@PathVariable("mid") int magazineId, HttpServletRequest req, HttpServletResponse res) {
		return advertisementService.getAllAdvertisementsByMagazineId(magazineId);
	}
}
