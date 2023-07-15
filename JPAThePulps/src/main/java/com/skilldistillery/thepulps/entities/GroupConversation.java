package com.skilldistillery.thepulps.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "group_conversation")
public class GroupConversation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

}
