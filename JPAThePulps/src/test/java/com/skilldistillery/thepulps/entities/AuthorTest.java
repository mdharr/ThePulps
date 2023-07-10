package com.skilldistillery.thepulps.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AuthorTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Author author;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAThePulps");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		author = em.find(Author.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		author = null;
	}

	@Test
	void test_Author_entity_mapping() {
		assertNotNull(author);
		assertEquals("Robert E. Howard", author.getFullName());
	}
	
	@Test
	void test_Author_Story_many_to_many_mapping() {
		assertNotNull(author);
		assertEquals("Red Shadows", author.getStories().get(0).getTitle());
	}
	
	@Test
	void test_Author_Tag_many_to_many_mapping() {
		assertNotNull(author);
		assertEquals("HORROR", author.getTags().get(0).getGenre().toString());
	}

}
