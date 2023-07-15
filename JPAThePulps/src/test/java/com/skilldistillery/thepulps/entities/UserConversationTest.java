package com.skilldistillery.thepulps.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.Month;
import java.util.Comparator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserConversationTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserConversation userConversation;

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
		userConversation = em.find(UserConversation.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userConversation = null;
	}

	@Test
	void test_UserConversation_entity_mapping() {
		assertNotNull(userConversation);
		assertTrue(userConversation.getPrivateMessages().size() > 0);
		assertEquals(2023, userConversation.getCreatedAt().getYear());
		assertEquals(Month.JUNE, userConversation.getCreatedAt().getMonth());
	}
	
	@Test
	void test_UserConversation_User_many_to_one_mapping() {
		assertNotNull(userConversation);
		assertEquals("Solomon", userConversation.getUser().getUsername());
	}
	
	@Test
	void test_UserConversation_PrivateMessage_one_to_many_mapping() {
		assertNotNull(userConversation);
		List<PrivateMessage> messages = userConversation.getPrivateMessages();
	    messages.sort(Comparator.comparing(PrivateMessage::getCreatedAt));
		assertEquals(messages.get(0).getSender().getUsername(), userConversation.getUser().getUsername());
		assertEquals("Solomon", messages.get(0).getSender().getUsername());
		assertEquals("We were both written by the same author.", messages.get(0).getContent());
		assertEquals("Too bad I am stuck in the Hyborean Age.", messages.get(1).getContent());
	}

}
