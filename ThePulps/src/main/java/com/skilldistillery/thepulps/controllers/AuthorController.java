package com.skilldistillery.thepulps.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Author;
import com.skilldistillery.thepulps.services.AuthorService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class AuthorController {
	
	@Autowired
	private AuthorService authorService;
	
    @GetMapping("authors")
    public List<Author> getAllAuthors() {
        return authorService.getAllAuthors();
    }
    
    @GetMapping("authors/{aid}")
    public Author getAuthorById(@PathVariable("aid") int authorId, HttpServletResponse res) {
    	if(authorService.getAuthorById(authorId) == null) {
    		res.setStatus(404);
    	}
    	return authorService.getAuthorById(authorId);
    }

}
