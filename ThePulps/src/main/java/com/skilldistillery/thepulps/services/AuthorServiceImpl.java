package com.skilldistillery.thepulps.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.Author;
import com.skilldistillery.thepulps.repositories.AuthorRepository;

@Service
public class AuthorServiceImpl implements AuthorService {
	
	@Autowired
	private AuthorRepository authorRepo;

	@Override
	public List<Author> getAllAuthors() {
		return authorRepo.findAll();
	}

	@Override
	public Author getAuthorById(int authorId) {
		Author author = null;
		Optional<Author> authorOpt = authorRepo.findById(authorId);
		if(authorOpt.isPresent()) {
			author = authorOpt.get();
		}
		return author;
	}

}
