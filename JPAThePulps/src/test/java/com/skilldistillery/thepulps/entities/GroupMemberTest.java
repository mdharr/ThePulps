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

class GroupMemberTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private GroupMember groupMember;

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
		groupMember = em.find(GroupMember.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		groupMember = null;
	}

	@Test
	void test_GroupMember_entity_mapping() {
		assertNotNull(groupMember);
		assertEquals(2023, groupMember.getCreatedAt().getYear());
		assertEquals(Month.JUNE, groupMember.getCreatedAt().getMonth());
	}
	
	@Test
	void test_GroupMember_User_many_to_one_mapping() {
		assertNotNull(groupMember);
		assertEquals("Solomon", groupMember.getUser().getUsername());
	}
	
	@Test
	void test_GroupMember_Group_many_to_one_mapping() {
		assertNotNull(groupMember);
		assertEquals("Solomon", groupMember.getMemberGroup().getUser().getUsername());
	}

}
