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

class StoryImageTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private StoryImage storyImage;

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
		storyImage = em.find(StoryImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		storyImage = null;
	}

	@Test
	void test_StoryImage_entity_mapping() {
		assertNotNull(storyImage);
		assertEquals("https://www.gutenberg.org/files/69607/69607-h/images/illus1.jpg", storyImage.getImageUrl());
	}
	
	@Test
	void test_StoryImage_Story_one_to_many_mapping() {
		assertNotNull(storyImage);
		assertEquals("The Mystery of Black Jean", storyImage.getStory().getTitle());
	}

}
