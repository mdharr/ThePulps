package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "group_member")
public class GroupMember {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
//	@JsonIgnore
    @ManyToOne
    @JoinColumn(name = "member_group_id")
    private MemberGroup memberGroup;
    
//	@JsonIgnore
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
	@JsonIgnore
    @OneToMany(mappedBy = "groupMember")
    private List<GroupMessage> groupMessages;

	public GroupMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GroupMember(int id, LocalDateTime createdAt, MemberGroup memberGroup, User user, List<GroupMessage> groupMessages) {
		super();
		this.id = id;
		this.createdAt = createdAt;
		this.memberGroup = memberGroup;
		this.user = user;
		this.groupMessages = groupMessages;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public MemberGroup getMemberGroup() {
		return memberGroup;
	}

	public void setMemberGroup(MemberGroup memberGroup) {
		this.memberGroup = memberGroup;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<GroupMessage> getGroupMessages() {
		return groupMessages;
	}

	public void setGroupMessages(List<GroupMessage> groupMessages) {
		this.groupMessages = groupMessages;
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
		GroupMember other = (GroupMember) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GroupMember [id=").append(id).append(", createdAt=").append(createdAt).append(", memberGroup=")
				.append(memberGroup).append(", user=").append(user).append("]");
		return builder.toString();
	}
	
}
