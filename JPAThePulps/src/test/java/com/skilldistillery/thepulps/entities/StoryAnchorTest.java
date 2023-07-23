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

class StoryAnchorTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private StoryAnchor storyAnchor;
	
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
		storyAnchor = em.find(StoryAnchor.class, new StoryAnchorId(1, 1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		storyAnchor = null;
	}

	@Test
	void test_StoryAnchor_entity_mapping() {
		assertNotNull(storyAnchor);
		assertEquals("BLACK_JEAN", storyAnchor.getAnchorTag());
	}
	
	@Test
	void test_StoryAnchor_MagazineHtml_many_to_one_mapping() {
		assertNotNull(storyAnchor);
		assertEquals("https://www.gutenberg.org/files/68957/68957-h/68957-h.htm", storyAnchor.getMagazineHtml().getFileUrl());
	}
	
	@Test
	void test_StoryAnchor_Story_many_to_one_mapping() {
		assertNotNull(storyAnchor);
		assertEquals("The Mystery of Black Jean", storyAnchor.getStory().getTitle());
	}
	
	@Test
	void test_StoryAnchor_Magazine_many_to_many_mapping() {
		assertNotNull(storyAnchor);
		assertEquals("Weird Tales, March 1923", storyAnchor.getMagazineHtml().getMagazine().getName());
	}

}
