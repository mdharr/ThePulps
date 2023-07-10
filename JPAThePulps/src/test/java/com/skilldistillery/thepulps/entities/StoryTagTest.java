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

class StoryTagTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private StoryTag storyTag;
	
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
		storyTag = em.find(StoryTag.class, new StoryTagId(1, 2));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		storyTag = null;
	}

	@Test
	void test_StoryTag_Story_many_to_many_mapping() {
		assertNotNull(storyTag);
		assertEquals("Red Shadows", storyTag.getStory().getTitle());
	}
	
	@Test
	void test_StoryTag_Tag_many_to_many_mapping() {
		assertNotNull(storyTag);
		assertEquals("HORROR", storyTag.getTag().getGenre().toString());
	}

}
