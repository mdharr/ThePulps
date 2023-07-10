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

class TagTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Tag tag;

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
		tag = em.find(Tag.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		tag = null;
	}

	@Test
	void test_Author_entity_mapping() {
		assertNotNull(tag);
		assertEquals("DETECTIVE_CRIME", tag.getGenre().toString());
	}

}
