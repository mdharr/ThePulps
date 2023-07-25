package com.skilldistillery.thepulps.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("users/{uid}/collections")
	public List<Collection> getAllUserCollectionsByUserId(@PathVariable("uid") int userId, HttpServletRequest req, HttpServletResponse res) {
		return collectionService.getByUserId(userId);
	}
	
	@PostMapping("users/{uid}/collections")
	public Collection createCollection(@PathVariable("uid") int userId, Principal principal, HttpServletRequest req, HttpServletResponse res, @RequestBody Collection collection) {
		
		try {
			collectionService.createCollection(principal.getName(), collection);
			res.setStatus(201);
			StringBuffer url = req.getRequestURL();
			url.append("/").append(collection.getId());
			res.setHeader("Location", url.toString());			
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			collection = null;
		}
		
		return collection;
		
	}

}
