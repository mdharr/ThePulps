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

class AuthorTagTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private AuthorTag authorTag;
	
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
		authorTag = em.find(AuthorTag.class, new AuthorTagId(1, 2));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		authorTag = null;
	}

	@Test
	void test_AuthorTag_Author_many_to_many_mapping() {
		assertNotNull(authorTag);
		assertEquals("Julian Kilman", authorTag.getAuthor().getFullName());
	}
	
	@Test
	void test_AuthorTag_Tag_many_to_many_mapping() {
		assertNotNull(authorTag);
		assertEquals("HORROR", authorTag.getTag().getGenre().toString());
	}

}
