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

class PublicationTest {
	
	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Publication publication;

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
		publication = em.find(Publication.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		publication = null;
	}

	@Test
	void test_Publication_entity_mapping() {
		assertNotNull(publication);
		assertEquals("Weird Tales Magazine", publication.getName());
	}
	
	@Test
	void test_Publication_Magazine_one_to_many_mapping() {
		assertNotNull(publication);
		assertEquals("Weird Tales, March 1923", publication.getMagazines().get(0).getName());
	}
	
	@Test
	void test_Publication_Tag_many_to_many_mapping() {
		assertNotNull(publication);
		assertEquals("HORROR", publication.getTags().get(0).getGenre().toString());
	}

}
