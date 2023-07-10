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

class PublicationTagTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private PublicationTag publicationTag;
	
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
		publicationTag = em.find(PublicationTag.class, new PublicationTagId(1, 2));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		publicationTag = null;
	}

	@Test
	void test_PublicationTag_Publication_many_to_many_mapping() {
		assertNotNull(publicationTag);
		assertEquals("Weird Tales", publicationTag.getPublication().getName());
	}
	
	@Test
	void test_PublicationTag_Tag_many_to_many_mapping() {
		assertNotNull(publicationTag);
		assertEquals("HORROR", publicationTag.getTag().getGenre().toString());
	}

}
