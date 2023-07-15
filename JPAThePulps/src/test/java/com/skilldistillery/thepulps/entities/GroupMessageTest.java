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

class GroupMessageTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private GroupMessage groupMessage;

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
		groupMessage = em.find(GroupMessage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		groupMessage = null;
	}

	@Test
	void test_GroupMessage_entity_mapping() {
		assertNotNull(groupMessage);
		assertEquals(2023, groupMessage.getCreatedAt().getYear());
		assertEquals(Month.JUNE, groupMessage.getCreatedAt().getMonth());
	}
	
	@Test
	void test_GroupMessage_GroupMember_many_to_one_mapping() {
		assertNotNull(groupMessage);
		assertEquals("Solomon", groupMessage.getGroupMember().getUser().getUsername());
	}
	
	@Test
	void test_GroupMessage_GroupConversation_many_to_one_mapping() {
		assertNotNull(groupMessage);
		assertEquals(2023, groupMessage.getGroupConversation().getCreatedAt().getYear());
		assertEquals(Month.JUNE, groupMessage.getGroupConversation().getCreatedAt().getMonth());
	}

}
