package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.MemberGroup;
import com.skilldistillery.thepulps.services.MemberGroupService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MemberGroupController {
	
	@Autowired
	private MemberGroupService memberGroupService;
	
	@GetMapping("member-groups")
	public List<MemberGroup> getAllMemberGroups() {
		return memberGroupService.getAllMemberGroups();
	}

}
