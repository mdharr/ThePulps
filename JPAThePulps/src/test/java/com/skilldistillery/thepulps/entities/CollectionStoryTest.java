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

class CollectionStoryTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private CollectionStory collectionStory;
	
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
		collectionStory = em.find(CollectionStory.class, new CollectionStoryId(1, 1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		collectionStory = null;
	}

	@Test
	void test_CollectionStory_Collection_many_to_many_mapping() {
		assertNotNull(collectionStory);
		assertEquals("Favorites", collectionStory.getCollection().getName());
	}
	
	@Test
	void test_CollectionStory_Story_many_to_many_mapping() {
		assertNotNull(collectionStory);
		assertEquals("The Mystery of Black Jean", collectionStory.getStory().getTitle());
	}

}
