package model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "HOADON")
public class HoaDon {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ma_hoa_don = 0;
	@Column(name = "ho_ten")
	private String ho_ten;
	@Column(name = "dia_chi")
	private String dia_chi;
	@Column(name = "dien_thoai")
	private String dien_thoai;
	@Column(name = "ngay_lap")
	private Date ngay_lap;
	public HoaDon() {
		super();
	}
	public HoaDon(int ma_hoa_don, String ho_ten, String dia_chi, String dien_thoai, Date ngay_lap) {
		super();
		this.ma_hoa_don = ma_hoa_don;
		this.ho_ten = ho_ten;
		this.dia_chi = dia_chi;
		this.dien_thoai = dien_thoai;
		this.ngay_lap = ngay_lap;
	}
	public int getMa_hoa_don() {
		return ma_hoa_don;
	}
	public void setMa_hoa_don(int ma_hoa_don) {
		this.ma_hoa_don = ma_hoa_don;
	}
	public String getHo_ten() {
		return ho_ten;
	}
	public void setHo_ten(String ho_ten) {
		this.ho_ten = ho_ten;
	}
	public String getDia_chi() {
		return dia_chi;
	}
	public void setDia_chi(String dia_chi) {
		this.dia_chi = dia_chi;
	}
	public String getDien_thoai() {
		return dien_thoai;
	}
	public void setDien_thoai(String dien_thoai) {
		this.dien_thoai = dien_thoai;
	}
	public Date getNgay_lap() {
		return ngay_lap;
	}
	public void setNgay_lap(Date ngay_lap) {
		this.ngay_lap = ngay_lap;
	}
	
	
}
