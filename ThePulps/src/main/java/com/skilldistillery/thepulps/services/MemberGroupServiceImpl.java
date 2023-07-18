package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.MemberGroup;
import com.skilldistillery.thepulps.repositories.MemberGroupRepository;

@Service
public class MemberGroupServiceImpl implements MemberGroupService {
	
	@Autowired
	private MemberGroupRepository memberGroupRepo;

	@Override
	public List<MemberGroup> getAllMemberGroups() {
		return memberGroupRepo.findAll();
	}

}
