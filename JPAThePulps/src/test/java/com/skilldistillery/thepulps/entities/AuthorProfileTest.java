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

class AuthorProfileTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private AuthorProfile authorProfile;

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
		authorProfile = em.find(AuthorProfile.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		authorProfile = null;
	}

	@Test
	void test_AuthorProfile_entity_mapping() {
		assertNotNull(authorProfile);
		assertEquals("Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.", authorProfile.getBio());
	}
	
	@Test
	void test_AuthorProfile_Author_one_to_one_mapping() {
		assertNotNull(authorProfile);
		assertEquals("Julian Kilman", authorProfile.getAuthor().getFullName());
	}

}
