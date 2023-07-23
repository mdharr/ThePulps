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

class StoryMemberTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private StoryMember storyMember;
	
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
		storyMember = em.find(StoryMember.class, new StoryMemberId(1, 1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		storyMember = null;
	}

	@Test
	void test_StoryMember_Story_many_to_many_mapping() {
		assertNotNull(storyMember);
		assertEquals("The Mystery of Black Jean", storyMember.getStory().getTitle());
	}
	
	@Test
	void test_StoryMember_Character_many_to_many_mapping() {
		assertNotNull(storyMember);
		assertEquals("Solomon Kane", storyMember.getMember().getName());
	}

}
