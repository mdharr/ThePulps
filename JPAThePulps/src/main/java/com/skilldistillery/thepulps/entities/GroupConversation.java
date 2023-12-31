package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "group_conversation")
public class GroupConversation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@UpdateTimestamp
	@Column(name = "updated_at")
	private LocalDateTime updatedAt;
	
    @OneToOne(mappedBy = "groupConversation")
    private MemberGroup memberGroup;
    
    @OneToMany(mappedBy = "groupConversation")
    private List<GroupMessage> groupMessages;

	public GroupConversation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GroupConversation(int id, LocalDateTime createdAt, LocalDateTime updatedAt, MemberGroup memberGroup,
			List<GroupMessage> groupMessages) {
		super();
		this.id = id;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.memberGroup = memberGroup;
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

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public MemberGroup getMemberGroup() {
		return memberGroup;
	}

	public void setMemberGroup(MemberGroup memberGroup) {
		this.memberGroup = memberGroup;
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
		GroupConversation other = (GroupConversation) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GroupConversation [id=").append(id).append(", createdAt=").append(createdAt)
				.append(", updatedAt=").append(updatedAt).append(", memberGroup=").append(memberGroup).append("]");
		return builder.toString();
	}

}
