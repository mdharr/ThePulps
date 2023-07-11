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

class CollectionTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Collection collection;

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
		collection = em.find(Collection.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		collection = null;
	}

	@Test
	void test_Collection_entity_mapping() {
		assertNotNull(collection);
		assertEquals("Favorites", collection.getName());
	}
	
	@Test
	void test_Magazine_Publication_many_to_one_mapping() {
		assertNotNull(collection);
		assertEquals("admin", collection.getUser().getUsername());
	}
	
//	@Test
//	void test_Magazine_Tag_many_to_many_mapping() {
//		assertNotNull(magazine);
//		assertEquals("HORROR", magazine.getTags().get(0).getGenre().toString());
//	}

}
