package com.skilldistillery.thepulps.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Publication {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;

	public Publication() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Publication(int id, String name) {
		super();
		this.id = id;
		this.name = name;
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
		Publication other = (Publication) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Publication [id=").append(id).append(", name=").append(name).append("]");
		return builder.toString();
	}
	
}