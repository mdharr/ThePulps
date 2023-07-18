package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "member_group")
public class MemberGroup {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;
	
	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "group_conversation_id")
	private GroupConversation groupConversation;
	
	@JsonIgnore
    @OneToMany(mappedBy = "memberGroup")
    private List<GroupMember> groupMembers;

	public MemberGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberGroup(int id, String name, String description, LocalDateTime createdAt, User user,
			GroupConversation groupConversation, List<GroupMember> groupMembers) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.createdAt = createdAt;
		this.user = user;
		this.groupConversation = groupConversation;
		this.groupMembers = groupMembers;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public GroupConversation getGroupConversation() {
		return groupConversation;
	}

	public void setGroupConversation(GroupConversation groupConversation) {
		this.groupConversation = groupConversation;
	}

	public List<GroupMember> getGroupMembers() {
		return groupMembers;
	}

	public void setGroupMembers(List<GroupMember> groupMembers) {
		this.groupMembers = groupMembers;
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
		MemberGroup other = (MemberGroup) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Group [id=").append(id).append(", name=").append(name).append(", description=")
				.append(description).append(", createdAt=").append(createdAt).append(", user=").append(user)
				.append(", groupConversation=").append(groupConversation).append("]");
		return builder.toString();
	}
	
}
