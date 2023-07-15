package com.skilldistillery.thepulps.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.Month;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class GroupConversationTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private GroupConversation groupConversation;

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
		groupConversation = em.find(GroupConversation.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		groupConversation = null;
	}

	@Test
	void test_GroupConversation_entity_mapping() {
		assertNotNull(groupConversation);
		assertEquals(2023, groupConversation.getCreatedAt().getYear());
		assertEquals(Month.JUNE, groupConversation.getCreatedAt().getMonth());
	}
	
	@Test
	void test_GroupConversation_MemberGroup_one_to_one_mapping() {
		assertNotNull(groupConversation);
		assertEquals("Robert E. Howard Club", groupConversation.getMemberGroup().getName());
	}
	
	@Test
	void test_GroupConversation_Message_one_to_one_mapping() {
		assertNotNull(groupConversation);
		assertEquals("Hello REH enthusiasts!", groupConversation.getGroupMessages().get(0).getMessage());
	}

}
