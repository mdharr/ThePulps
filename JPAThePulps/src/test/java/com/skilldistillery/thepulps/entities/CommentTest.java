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

class CommentTest {

	private static EntityManagerFactory emf;
	
	private EntityManager em;
	
	private Comment comment;

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
		comment = em.find(Comment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}

	@Test
	void test_Comment_entity_mapping() {
		assertNotNull(comment);
		assertEquals(2023, comment.getCreatedAt().getYear());
		assertEquals(Month.MARCH, comment.getCreatedAt().getMonth());
	}
	
	@Test
	void test_Comment_User_many_to_one_mapping() {
		assertNotNull(comment);
		assertEquals("Solomon", comment.getUser().getUsername());
	}
	
	@Test
	void test_Comment_Post_many_to_one_mapping() {
		assertNotNull(comment);
		assertEquals(2023, comment.getPost().getCreatedAt().getYear());
		assertEquals(Month.MARCH, comment.getPost().getCreatedAt().getMonth());
	}
	
	@Test
	void test_Comment_entity_mapping_v2() {
		assertNotNull(comment);
		assertEquals("I had the same experience.", comment.getContent());
	}
	
	@Test
	void test_Comment_Reply_one_to_many_mapping() {
		assertNotNull(comment);
		assertEquals("As did I.", comment.getReplies().get(0).getContent());
	}
	
	@Test
	void test_Reply_ParentComment_many_to_one_mapping() {
		assertNotNull(comment);
		assertEquals("I had the same experience.", comment.getReplies().get(0).getParentComment().getContent());
	}

}
