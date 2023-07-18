package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.GroupMember;
import com.skilldistillery.thepulps.repositories.GroupMemberRepository;

@Service
public class GroupMemberServiceImpl implements GroupMemberService {
	
	@Autowired
	private GroupMemberRepository groupMemberRepo;

	@Override
	public List<GroupMember> getAllGroupMembers() {
		return groupMemberRepo.findAll();
	}

}
