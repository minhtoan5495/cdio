package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USER")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int user_id = 0;
	@Column(name = "ho_ten")
	private String ho_ten;	
	@Column(name = "dien_thoai")
	private String dien_thoai;
	@Column(name = "dia_chi")
	private String dia_chi;
	@Column(name = "role")
	private int role;
	@Column(name = "username")
	private String username;
	@Column(name = "password")
	private String password;
	

	public User() {
	}

	public User(int user_id, String ho_ten, String dien_thoai, String dia_chi, int role, String username, String password) {
		this.user_id = user_id;
		this.ho_ten = ho_ten;
		this.dien_thoai = dien_thoai;
		this.dia_chi = dia_chi;
		this.role = role;
		this.username = username;
		this.password = password;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getHo_ten() {
		return ho_ten;
	}

	public void setHoten(String ho_ten) {
		this.ho_ten = ho_ten;
	}

	public String getDien_thoai() {
		return dien_thoai;
	}

	public void setDien_thoai(String dien_thoai) {
		this.dien_thoai = dien_thoai;
	}

	public String getDia_chi() {
		return dia_chi;
	}

	public void setDia_chi(String dia_chi) {
		this.dia_chi = dia_chi;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

}
