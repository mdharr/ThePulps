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

class PrivateMessageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PrivateMessage privateMessage;

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
		privateMessage = em.find(PrivateMessage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		privateMessage = null;
	}

	@Test
	void test_PrivateMessage_entity_mapping() {
		assertNotNull(privateMessage);
		assertEquals("Solomon", privateMessage.getSender().getUsername());
		assertEquals("Conan", privateMessage.getRecipient().getUsername());
	}
	
	@Test
	void test_PrivateMessage_UserConversation_many_to_one_mapping() {
		assertNotNull(privateMessage);
		assertEquals(1, privateMessage.getUserConversation().getId());
	}
	
	@Test
	void test_PrivateMessage_User_many_to_many_mapping() {
		assertNotNull(privateMessage);
		assertEquals("Conan", privateMessage.getRecipient().getUsername());
	}

}
