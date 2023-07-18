package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.GroupMember;
import com.skilldistillery.thepulps.services.GroupMemberService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class GroupMemberController {
	
	@Autowired
	private GroupMemberService groupMemberService;
	
	@GetMapping("group-members")
	public List<GroupMember> getAllGroupMembers() {
		return groupMemberService.getAllGroupMembers();
	}

}
