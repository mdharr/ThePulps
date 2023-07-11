package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "story_member")
public class StoryMember {
	
	@EmbeddedId
	private StoryMemberId id;

	@ManyToOne
	@JoinColumn(name = "story_id")
	@MapsId(value = "storyId")
	private Story story;
	
	@ManyToOne
	@JoinColumn(name = "member_id")
	@MapsId(value = "memberId")
	private Member member;

	public StoryMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StoryMember(StoryMemberId id, Story story, Member member) {
		super();
		this.id = new StoryMemberId(story.getId(), member.getId());
		this.story = story;
		this.member = member;
	}

	public StoryMemberId getId() {
		return id;
	}

	public void setId(StoryMemberId id) {
		this.id = id;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StoryMember other = (StoryMember) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoryMember [id=").append(id).append(", story=").append(story).append(", member=")
				.append(member).append("]");
		return builder.toString();
	}

}
