package com.skilldistillery.thepulps.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "group_message")
public class GroupMessage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
    @ManyToOne
    @JoinColumn(name = "group_conversation_id")
    private GroupConversation groupConversation;
    
    @ManyToOne
    @JoinColumn(name = "group_member_id")
    private GroupMember groupMember;

    private String message;
    
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	public GroupMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GroupMessage(int id, GroupConversation groupConversation, GroupMember groupMember, String message,
			LocalDateTime createdAt) {
		super();
		this.id = id;
		this.groupConversation = groupConversation;
		this.groupMember = groupMember;
		this.message = message;
		this.createdAt = createdAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public GroupConversation getGroupConversation() {
		return groupConversation;
	}

	public void setGroupConversation(GroupConversation groupConversation) {
		this.groupConversation = groupConversation;
	}

	public GroupMember getGroupMember() {
		return groupMember;
	}

	public void setGroupMember(GroupMember groupMember) {
		this.groupMember = groupMember;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
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
		GroupMessage other = (GroupMessage) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GroupMessage [id=").append(id).append(", groupConversation=").append(groupConversation)
				.append(", groupMember=").append(groupMember).append(", message=").append(message)
				.append(", createdAt=").append(createdAt).append("]");
		return builder.toString();
	}
	
}
