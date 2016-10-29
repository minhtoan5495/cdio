package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIETHOADON")
public class ChiTietHoaDon {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ma_chi_tiet_hd = 0;
	@Column(name = "ma_hoa_don")
	private int ma_hoa_don;
	@Column(name = "ma_san_pham")
	private int ma_san_pham;
	@Column(name = "so_luong")
	private int so_luong;
	@Column(name = "gia_ban")
	private double gia_ban;
	public ChiTietHoaDon() {
		super();
	}
	public ChiTietHoaDon(int ma_chi_tiet_hd, int ma_hoa_don, int ma_san_pham, int so_luong, double gia_ban) {
		super();
		this.ma_chi_tiet_hd = ma_chi_tiet_hd;
		this.ma_hoa_don = ma_hoa_don;
		this.ma_san_pham = ma_san_pham;
		this.so_luong = so_luong;
		this.gia_ban = gia_ban;
	}
	public int getMa_chi_tiet_hd() {
		return ma_chi_tiet_hd;
	}
	public void setMa_chi_tiet_hd(int ma_chi_tiet_hd) {
		this.ma_chi_tiet_hd = ma_chi_tiet_hd;
	}
	public int getMa_hoa_don() {
		return ma_hoa_don;
	}
	public void setMa_hoa_don(int ma_hoa_don) {
		this.ma_hoa_don = ma_hoa_don;
	}
	public int getMa_san_pham() {
		return ma_san_pham;
	}
	public void setMa_san_pham(int ma_san_pham) {
		this.ma_san_pham = ma_san_pham;
	}
	public int getSo_luong() {
		return so_luong;
	}
	public void setSo_luong(int so_luong) {
		this.so_luong = so_luong;
	}
	public double getGia_ban() {
		return gia_ban;
	}
	public void setGia_ban(int gia_ban) {
		this.gia_ban = gia_ban;
	}
	
	
}
