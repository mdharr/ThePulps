package com.skilldistillery.thepulps.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.thepulps.entities.Member;
import com.skilldistillery.thepulps.services.MemberService;

@RestController
@CrossOrigin({"*", "http://localhost"})
@RequestMapping("api")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("members")
	public List<Member> getAllMembers() {
		return memberService.getAllMembers();
	}

}
