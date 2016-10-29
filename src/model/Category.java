package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CATEGORY")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int category_id = 0;
	@Column(name = "name")
	private String name;
	@Column(name = "parent")
	private int parent;

	public Category() {
	}

	public Category(int category_id, String name, int parent) {
		this.category_id = category_id;
		this.name = name;
		this.parent = parent;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}
}
