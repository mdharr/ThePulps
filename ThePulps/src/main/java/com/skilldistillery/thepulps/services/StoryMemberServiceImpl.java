package com.skilldistillery.thepulps.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.thepulps.entities.StoryMember;
import com.skilldistillery.thepulps.repositories.StoryMemberRepository;

@Service
public class StoryMemberServiceImpl implements StoryMemberService {
	
	@Autowired
	private StoryMemberRepository storyMemberRepo;

	@Override
	public List<StoryMember> getAllStoryMembers() {
		return storyMemberRepo.findAll();
	}

}
