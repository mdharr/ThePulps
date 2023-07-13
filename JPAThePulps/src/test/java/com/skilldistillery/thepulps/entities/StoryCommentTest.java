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

class StoryCommentTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private StoryComment storyComment;

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
		storyComment = em.find(StoryComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		storyComment = null;
	}

	@Test
	void test_StoryComment_entity_mapping() {
		assertNotNull(storyComment);
		assertEquals("Slowly he rose, mechanically wiping his hands upon his cloak. A dark scowl had settled on his somber brow. Yet he made no wild, reckless vow, swore no oath by saints or devils.", storyComment.getContent());
	}
	
	@Test
	void test_StoryComment_User_many_to_one_mapping() {
		assertNotNull(storyComment);
		assertEquals("admin", storyComment.getUser().getUsername());
	}
	
	@Test
	void test_StoryComment_Reply_one_to_many_mapping() {
		assertNotNull(storyComment);
		assertEquals("\"Men shall die for this,\" he said coldly.", storyComment.getReplies().get(0).getContent());
	}
	
	@Test
	void test_Reply_ParentComment_many_to_one_mapping() {
		assertNotNull(storyComment);
		assertEquals("Slowly he rose, mechanically wiping his hands upon his cloak. A dark scowl had settled on his somber brow. Yet he made no wild, reckless vow, swore no oath by saints or devils.", storyComment.getReplies().get(0).getParentComment().getContent());
	}
	
	@Test
	void test_StoryComment_Story_many_to_one_mapping() {
		assertNotNull(storyComment);
		assertEquals("Red Shadows", storyComment.getStory().getTitle());
	}

}
