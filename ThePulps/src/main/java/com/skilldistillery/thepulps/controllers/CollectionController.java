package com.skilldistillery.thepulps.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	public List<Collection> getAllUserCollectionsByUserId(@PathVariable("uid") int userId, Principal principal, HttpServletRequest req, HttpServletResponse res) {
		return collectionService.getByUser(principal.getName());
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
	
	@DeleteMapping("users/{uid}/collections/{cid}")
	public ResponseEntity<?> deleteCollection(@PathVariable("uid") int userId, @PathVariable("cid") Integer collectionId, Principal principal) {
	    String username = principal.getName();

	    if (collectionService.deleteCollection(username, collectionId)) {
	        return ResponseEntity.ok().build();
	    } else {
	        return ResponseEntity.notFound().build();
	    }
	}
	
    @PostMapping("users/{uid}/collections/{cid}/stories/{sid}")
    public Collection addStoryToCollection(@PathVariable("uid") int userId,
                                           @PathVariable("cid") Integer collectionId,
                                           @PathVariable("sid") Integer storyId,
                                           Principal principal) {
        String username = principal.getName();
        return collectionService.addStoryToCollection(username, collectionId, storyId);
    }
	
    @DeleteMapping("users/{uid}/collections/{cid}/stories/{sid}")
    public Collection removeStoryFromCollection(@PathVariable("uid") int userId,
                                                @PathVariable("cid") Integer collectionId,
                                                @PathVariable("sid") int storyId,
                                                Principal principal) {
        String username = principal.getName();
        return collectionService.removeStoryFromCollection(username, collectionId, storyId);
    }

}
